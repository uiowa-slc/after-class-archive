<?php
class Page extends SiteTree {

	public static $db = array(
	);

	public static $has_one = array(
	
		"SecondaryContent" => "HTMLText"
	
	);
	public function getEventtypes() {
		return DataObject::get('Eventtype');
	}
	public function getVenues() {
		return DataObject::get('Venue','','Title ASC');
	}
	public function getSponsors() {
		return DataObject::get('Sponsor', '','Title ASC');
	}
		
    public static function NewsletterFormShortCodeHandler($arguments,$caption= null,$parser = null) {
		//get our template
		$template = new SSViewer('NewsletterForm');
		
		$customise = array();
		
		//return the customised template
		return $template->process(new ArrayData($customise));
	}
	
function allPagesToCache() {
    // Get each page type to define its sub-urls
    $urls = array();
    // memory intensive depending on number of pages
    $pages = DataObject::get("Page");
    $ignored = array('UserDefinedForm', 'AddEventPage', 'FeedbackPage');

    foreach($pages as $page) {
    	if(!in_array($page->ClassName, $ignored)) {
    		if($page->isPublished()){
	    		$urls = array_merge($urls, (array)$page->subPagesToCache());
	    	}
	    }
    }
    
    $urls[] = 'events/categories/';
    $urls[] = 'events/sponsors/';
    $urls[] = 'events/venues/';     
    // add any custom URLs which are not SiteTree instances
    //$urls[] = "sitemap.xml";
 
    return $urls;
  }
 
 /**
 
   * Get a list of URLs to cache related to this page
   */
  function subPagesToCache() {
    $urls = array();
 
    // add current page
    $urls[] = $this->Link();
     
    // cache the RSS feed if comments are enabled
    if ($this->ProvideComments) {
      $urls[] = Director::absoluteBaseURL() . "pagecomment/rss/" . $this->ID;
    }
     
    return $urls;
  }
   
  function pagesAffectedByChanges() {
    $urls = $this->subPagesToCache();
    if($p = $this->Parent) $urls = array_merge((array)$urls, (array)$p->subPagesToCache());
    
   /* $urls[] = 'events/categories/';
    $urls[] = 'events/sponsors/';
    $urls[] = 'events/venues/'; */
    
    return $urls;
  }

}
class Page_Controller extends ContentController {

	/**
	 * An array of actions that can be accessed via a request. Each array element should be an action name, and the
	 * permissions or conditions required to allow the user to access it.
	 *
	 * <code>
	 * array (
	 *     'action', // anyone can access this action
	 *     'action' => true, // same as above
	 *     'action' => 'ADMIN', // you must have ADMIN permissions to access this action
	 *     'action' => '->checkAction' // you can only access this action if $this->checkAction() returns true
	 * );
	 * </code>
	 *
	 * @var array
	 */
	/*public static $allowed_actions = array (
	);*/

	public function init() {
		parent::init();
		// Note: you should use SS template require tags inside your templates 
		// instead of putting Requirements calls here.  However these are 
		// included so that our older themes still work
		//echo $_SERVER['HTTP_USER_AGENT'];
		
		//Requirements::block('sapphire/thirdparty/jquery/jquery.js'); 
		
		
		$themeFolder = $this->ThemeDir();
		 
		//Set the folder to our theme so that relative image paths work
		Requirements::set_combined_files_folder($themeFolder . '/combinedfiles');
		
		Requirements::block('event_calendar/css/calendar_widget.css'); 
		Requirements::block('division-bar/js/_division-bar.js');
		//Requirements::block('sapphire/thirdparty/jquery/jquery.js'); 
		/*
		Requirements::block('event_calendar/javascript/locale/date_en.js'); 
		Requirements::block('event_calendar/javascript/jquery.date.js'); 
		Requirements::block('event_calendar/javascript/jquery.datePicker.js'); 
		Requirements::block('event_calendar/javascript/calendar_core.js'); 
		Requirements::block('event_calendar/javascript/calendar_widget.js');
		 */
		
		$jsFiles = array(
		
			   // 'themes/afterclass2/js/jquery.min.js',
			   // 'themes/afterclass2/js/jquery-migrate.js',
			    'sapphire/thirdparty/jquery/jquery.js',
			    'division-bar/js/division-bar.js',
			   	'event_calendar/javascript/calendar_core.js',
			    'event_calendar/javascript/locale/date_en.js',
			    'event_calendar/javascript/jquery.date.js',
			    'event_calendar/javascript/jquery.datePicker.js',
			    'event_calendar/javascript/calendar_widget.js',
			    'themes/afterclass2/js/modernizr-2.0.6.min.js',
			    /*'themes/afterclass2/js/canvasplay/CanvasController.js',
			    'themes/afterclass2/js/canvasplay/DisplayObject.js',
			    'themes/afterclass2/js/canvasplay/DisplayContainer.js',
			    'themes/afterclass2/js/canvasplay/Shape.js',
			    'themes/afterclass2/js/canvasplay/Circle.js',
			    'themes/afterclass2/js/canvasplay/Star.js',
			    'themes/afterclass2/js/canvasplay/Rectangle.js',
			    'themes/afterclass2/js/canvasplay/Orb.js',
			    'themes/afterclass2/js/canvasplay/StarOrb.js',
			    'themes/afterclass2/js/canvasplay/Point.js',
			    'themes/afterclass2/js/canvasplay/Bounds.js',
			    'themes/afterclass2/js/canvasplay/Ticker.js',
			    'themes/afterclass2/js/canvasplay/ColorPool.js',
			    'themes/afterclass2/js/canvasplay/ObjectPool.js',
			    'themes/afterclass2/js/canvasplay/FixedVibration.js',
			    'themes/afterclass2/js/canvasplay/Emitter.js',
			    'themes/afterclass2/js/canvasplay/VariableVibration.js',
			    'themes/afterclass2/js/canvasplay/ExitBoundsTrigger.js',
			    'themes/afterclass2/js/canvasplay/BehaviourManager.js',
			    'themes/afterclass2/js/canvasplay/TriggerManager.js',
			    
			    'themes/afterclass2/js/stars.js',*/
			    'themes/afterclass2/js/jquery.sticky-div.js',
			    'themes/afterclass2/js/fancybox/jquery.fancybox.pack.js',
			    'themes/afterclass2/js/flexslider/jquery.flexslider-min.js',
			    'themes/afterclass2/js/mailchimp.js',
			   
			    'themes/afterclass2/js/init.js',


			);

			//Add all the files to combine into an array
			$cssFiles = array(
			    $themeFolder . '/css/layout.css',
			    $themeFolder . '/css/grid.css',
			    $themeFolder . '/css/calendar_widget.css',
				$themeFolder .'/js/fancybox/jquery.fancybox.css'

			);


			Requirements::combine_files("combinedCSS.css", $cssFiles);
			Requirements::combine_files(
				'allcombined.js',$jsFiles);
	
 	}
	
	public function MonthLink()
	  {
	  	$calendar = DataObject::get_one("AfterClassCalendar");
	    $d = new sfDate();
		return $calendar->AbsoluteLink()."view/".$d->firstDayOfMonth()->format('Ym');
	  }
	public function TodayLink()
	  {
	  	$calendar = DataObject::get_one("AfterClassCalendar");
	    $d = new sfDate();
		return $calendar->AbsoluteLink()."view/".date("Ymd");
	  }	  
	  public function WeekLink()
	  {
	  	$calendar = DataObject::get_one("AfterClassCalendar");
	  	$d = new sfDate();
		return $calendar->AbsoluteLink()."view/".$d->firstDayOfWeek()->format('Ymd')."/".$d->finalDayOfWeek()->format('Ymd');
	  }
	  
	  public function WeekendLink()
	  {
	  	$calendar = DataObject::get_one("AfterClassCalendar");
	  	$d = new sfDate();
			// Saturday? Dial back to Friday
	  	if($d->format('w') == 6)
	  		$d->previousDay();
	  	// Before Friday? Advance. Otherwise, it's Friday, so leave it alone.
	  	else if($d->format('w') < 5)
	  		$d->nextDay(sfTime::FRIDAY);
	  	
		return $calendar->AbsoluteLink()."view/".$d->format('Ymd')."/".$d->addDay(2)->format('Ymd');
	  }


	public function AllDeadlines(){
		$deadlines = DataObject::get("Deadline", $filter=null, $sort = "Date ASC");
		if($deadlines){
			return $deadlines;
		}
	
	}
	
	public function FutureDeadlines($number = 0){
		$deadlines = DataObject::get("Deadline", $filter="Date >= DATE(NOW())", $sort = "Date ASC", $join = null, $limit = $number);
	
		if($deadlines){
			return $deadlines;
		
		}
	}
	
	public function RandomNewEvent($pool_size = 6) {
	
		$newest_events = DataObject::get("AfterClassEvent", $filter = null, $sort = "Created DESC", $join = null, $limit = $pool_size);
			if(isset($newest_events)){
			$events = $newest_events->toArray();
			shuffle($events);
			return $events[0];
		}
	}	
	
	public function iswindows() {
		if (strpos(strtolower($_SERVER['HTTP_USER_AGENT']),"windows") === false) {
		  return false;
		} else {
		  return true;
		}
	}
	
	function results($data, $form){
	        $data = array(
	            'Results' => $form->getResults(),
	            'Query' => $form->getSearchQuery(),
	            'Title' => 'Search Results'
	        );
	        $this->Query = $form->getSearchQuery();
	     
	        return $this->customise($data)->renderWith(array('Page_results', 'Page'));
	}
	function EditURL(){
		return "/admin/show/".$this->ID."/";
	}
	
	public function handleRequest(SS_HTTPRequest $request) { 
		$ret = parent::handleRequest($request); 
		$temp=$ret->getBody(); 
		$temp = preg_replace("/(^[\r\n]*|[\r\n]+)[\s\t]*[\r\n]+/", "\n", $temp); 
		$ret->setBody($temp); 
		return $ret; 
	} 
	
	public function RandomTagline(){
		$config = SiteConfig::current_site_config(); 
		
		$taglines[] = $config->TaglineOption1;
		$taglines[] = $config->TaglineOption2;
		$taglines[] = $config->TaglineOption3;
		$taglines[] = $config->TaglineOption4;
		$taglines[] = $config->TaglineOption5;
		$taglines[] = $config->TaglineOption6;
		$taglines[] = $config->TaglineOption7;
		$taglines[] = $config->TaglineOption8;
		$taglines[] = $config->TaglineOption9;
		$taglines[] = $config->TaglineOption10;
		
		$taglines = array_filter($taglines);

	if(array_rand($taglines)){
			$randomTagline = $taglines[array_rand($taglines)];
			}else{
				$randomTagline ="";
			}
	
				if($randomTagline){
					return $randomTagline;
				}else {
					return "the best of UI's culture, events, and nightlife";
					
				}	
		
				}
		

	
}