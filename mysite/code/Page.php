<?php
class Page extends SiteTree {

	private static $db = array(
	);

	private static $has_one = array(

	
	);

	public function ActiveEventtypes(){
		return $this->ActiveCategories("Eventtype");
	}

	public function ActiveVenues(){
		return $this->ActiveCategories("Venue");
	}
	public function ActiveSponsors(){
		return $this->ActiveCategories("Sponsor");
	}
	public function AllVenues() {
		return Venue::get()->sort('Title ASC');
	}
	
	public function AllSponsors() {
		return Sponsor::get()->sort('Title ASC');
	}
	public function AllEventtypes() {
		return Eventtype::get();
	}
		

	public function ActiveCategories($category){
		$categories = $category::get();
		$categoriesArrayList = new ArrayList();

		foreach($categories as $category){
			if($category->Events()->First()){
				$categoriesArrayList->push($category);
			}
		}
		return $categoriesArrayList;		
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
	    $pages = Page::get();
	    $ignored = array('UserDefinedForm', 'AddEventPage', 'FeedbackPage', 'AfterClassNewsletter');

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

	    $categories = Category::get()->map()->toArray();
	    //print_r($categories);
	    foreach($categories as $key => $category){
	    	$urls[] = 'events/categories/'.$key.'/feed/json';
	    }

	  	$urls[] = 'events/monthjson/'.$previousMonthString.'/';
	  	$urls[] = 'events/monthjson/'.$currentMonthString.'/';
	  	$urls[] = 'events/monthjson/'.$nextMonthString.'/';

	  	//$urls[] = 'events/feed/rss';
	  	$urls[] = 'events/feed/json';
	  	$urls[] = 'events/feed/';

	  	$urls[] = 'events/categories/feed/json';

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

	public function init() {
		parent::init();
		 
		//Block all requirements because we're building them with grunt now.
		Requirements::block('event_calendar/css/calendar_widget.css');
		Requirements::block('event_calendar/css/calendar.css');

		Requirements::block('division-bar/js/_division-bar.js');
		Requirements::block('framework/thirdparty/jquery/jquery.js');
		Requirements::block('event_calendar/javascript/calendar.js');
		Requirements::block('event_calendar/javascript/calendar_widget.js');
		Requirements::block('event_calendar/javascript/lang/calendar_en.js');
		Requirements::block('event_calendar/javascript/calendar_widget_init.js');
	
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
