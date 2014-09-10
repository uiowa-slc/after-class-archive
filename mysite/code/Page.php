<?php
class Page extends SiteTree {

	private static $db = array(

	);

	private static $has_one = array(

	);

    public static function NewsletterFormShortCodeHandler($arguments,$caption= null,$parser = null) {
		//get our template
		$template = new SSViewer('NewsletterForm');
		$customise = array();
		
		//return the customised template
		return $template->process(new ArrayData($customise));
	}
	
	function allPagesToCache() {
		$calendar = LocalistCalendar::get()->First();
	    $calendarLink = $calendar->Link();

	    $urls[] = $calendarLink;
	    $urls[] = 'about/';
	    $urls[] = 'nearby/';

		$previousMonth = new DateTime();
		$previousMonth->modify('first day of last month');
		$previousMonthString = $previousMonth->format( 'Ym' );

	    $currentMonth = new DateTime();
	    $currentMonthString = $currentMonth->format('Ym');

	    $nextMonth = new DateTime();
		$nextMonth->modify( 'first day of next month' );
		$nextMonthString = $nextMonth->format( 'Ym' );

	  	$urls[] = $calendarLink.'monthjson/'.$previousMonthString.'/';
	  	$urls[] = $calendarLink.'monthjson/'.$currentMonthString.'/';
	  	$urls[] = $calendarLink.'monthjson/'.$nextMonthString.'/';

	  	/* Cache all current events from master event list */
	  	
	  	$events = $calendar->EventList();

	  	foreach($events as $event){
	  		$urls[] = $event->Link();
	  	}

	  	/* Cache all Trending Tags */
	  	$trendingTags = $calendar->TrendingTags();

	  	foreach($trendingTags as $trendingTag){
	  		$urls[] = $trendingTag->Link();
	  	}

		$urls[] = 'events/feed/json';
		$urls[] = 'events/feed/';
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
  		return LocalistCalendar::get()->First();
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
		$term = $form->getSearchQuery();
		$calendar = $this->Calendar();
		$events = $calendar->EventList('200', null, null, null, null,null, 'true', false, $term);

		$data = array( 
			"Results" => $events,
			"Term" => $term
		);

	    return $this->customise( $data )->renderWith( array( 'LocalistCalendar_search', 'Page' ) );

	}
	function EditURL(){
		return "/admin/pages/show/".$this->ID."/";
	}
}
