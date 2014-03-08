<?php
class Page extends SiteTree {

	private static $db = array(
	);

	private static $has_one = array(
	
		"SecondaryContent" => "HTMLText"
	
	);
	public function AllEventtypes() {
		return Eventtype::get();
	}

	public function ActiveEventtypes(){
		$eventTypes = Eventtype::get();
		$eventTypesArrayList = new ArrayList();

		foreach($eventTypes as $eventType){
			if($eventType->Events()->First()){
				$eventTypesArrayList->push($eventType);
			}
		}
		return $eventTypesArrayList;
	}

	public function AllVenues() {
		return Venue::get()->sort('Title ASC');
	}
	
	public function AllSponsors() {
		return Sponsor::get()->sort('Title ASC');
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
	    //$pages = Page::get()->filter(array('ParentID:not' => 177));
	    $pages = Page::get();
	    $ignored = array('UserDefinedForm', 'AddEventPage', 'FeedbackPage');

	    foreach($pages as $page) {
	    	if(!in_array($page->ClassName, $ignored)) {
	    		if($page->isPublished()){
		    		$urls = array_merge($urls, (array)$page->subPagesToCache());
		    	}
		    }
	    }

		$previousMonth = new DateTime();
		$previousMonth->modify('first day of last month');
		$previousMonthString = $previousMonth->format( 'Ym' );

	    $currentMonth = new DateTime();
	    $currentMonthString = $currentMonth->format('Ym');

	    $nextMonth = new DateTime();
		$nextMonth->modify( 'first day of next month' );
		$nextMonthString = $nextMonth->format( 'Ym' );


	    $urls[] = 'events/categories/';
	    $urls[] = 'events/sponsors/';
	    $urls[] = 'events/venues/';

	  	$urls[] = 'events/monthjson/'.$previousMonthString.'/';
	  	$urls[] = 'events/monthjson/'.$currentMonthString.'/';
	  	$urls[] = 'events/monthjson/'.$nextMonthString.'/';

	  	$urls[] = 'events/feed/json';
	  	$urls[] = 'events/feed/';

	  	$urls[] = 'events/weekend/';
	  	$urls[] = 'events/today/';

	    return $urls;
	  }
	 
	function subPagesToCache() {
		$urls = array();
		$urls[] = $this->Link();
		return $urls;
	}
	   
	function pagesAffectedByChanges() {
		$urls = $this->subPagesToCache();
		if($p = $this->Parent) $urls = array_merge((array)$urls, (array)$p->subPagesToCache());
	    return $urls;
	}
	public function Calendar(){
  		return AfterClassCalendar::get()->First();
  	}
	public function TrendingCategories(){
		$categories = Category::get()->sort('RAND()');
		$trendingCats = new ArrayList();

		foreach($categories as $category){
			$catEvent = $category->Events()->First();

			if($catEvent){
				$trendingCats->push($category);
			}
		}

		return $trendingCats;
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
		$themeFolder = $this->ThemeDir();
		 
		//Set the folder to our theme so that relative image paths work
		Requirements::set_combined_files_folder($themeFolder . '/combinedfiles');
		
		Requirements::block('event_calendar/css/calendar_widget.css'); 
		Requirements::block('division-bar/js/_division-bar.js');

		
		$jsFiles = array(

			   'framework/thirdparty/jquery/jquery.js',
				'division-bar/js/division-bar.js',
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
			$themeFolder .'/js/fancybox/jquery.fancybox.css',
			$themeFolder . '/css/foundation-icons.css',

		);
		Requirements::combine_files("combinedCSS.css", $cssFiles);
		Requirements::combine_files(
			'allcombined.js',$jsFiles);
	
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
		return "/admin/pages/show/".$this->ID."/";
	}
}
