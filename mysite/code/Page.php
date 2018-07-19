<?php

use SilverStripe\View\SSViewer;
use SilverStripe\View\ArrayData;
use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\View\Requirements;
use SilverStripe\CMS\Controllers\ContentController;
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
		$calendar = UiCalendar::get()->First();
	    $calendarLink = $calendar->Link();

	    $urls[] = $calendarLink;
	    $urls[] = $calendarLink.'show/today';
	    $urls[] = $calendarLink.'show/weekend';

	    $urls[] = 'about/';
	    $urls[] = 'nearby/';
	    $urls[] = 'add/';


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
	  	// $trendingTags = $calendar->TrendingTags();

	  	// foreach($trendingTags as $trendingTag){
	  	// 	$urls[] = $trendingTag->Link();
	  	// }

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
  		return UiCalendar::get()->First();
  	}

}
