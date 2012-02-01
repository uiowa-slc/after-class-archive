<?php

class AfterClassCalendar extends Calendar {
/* static $has_many = array (
 'EventCategories' => 'EventCategory'
 );*/
	static $allowed_children = array (
	'AfterClassEvent'
	);
	
	public function UEvents() {
		$e = DataObject::get("AfterClassEvent")->toArray();;
		CalendarUtil::date_sort($e);
		return $e;
	}
	
	public function AllFeaturedEvents() {
	    return DataObject::get("AfterClassEvent","Featured IS TRUE");
	}
	public function Eventtype() {
	    return DataObject::get("Eventtype");
	}
	public function Sponsor() {
	    return DataObject::get("Sponsor");
	}
	public function Venue() {
	    return DataObject::get("Venue");
	}
	
	
	function FeaturedEvents() {
		$ids = array();
		// Get IDs of all featured events.
		$ids = array_merge($ids,$this->AllFeaturedEvents()->column('ID'));
		// Setup filter
		$filter = "`CalendarDateTime`.EventID IN (" . implode(',',$ids) . ")";
		// Get the calendar
		$calendar = DataObject::get_one("AfterClassCalendar");
		// Get the events from the calendar
		if (empty($ids)) {
			return false;
		} else {
			return $calendar->Events($filter);
		}
	}
	
}
 
class AfterClassCalendar_Controller extends Calendar_Controller {
 	 public static $url_handlers = array(
            //'tag/$Tag' => 'tag'
            'categories/$Category' => 'categories',
            'categoriesrss/$Category' => 'categoriesrss'
            );
 	static $allowed_actions = array ("categories", "view", "category", "sponsor", "venue", "newrss", "categoriesrss");
 	function getCurrentTag(){
 		if($this->urlParams['Tag']){
 			 $Tag = DataObject::get_one("Tag", "Title = '".$this->urlParams['Tag']."'");
 			 
 			 if($Tag){
 			 	return $Tag;
 			 }else{
 			 	return false;
 			 }
 		}else{
 			return false;
 		}
 	}
 	
 	# EventDate, EventLocation, EventCost
 	public function newrss() {
		$events = $this->data()->UpcomingEvents(null,$this->DefaultEventDisplay);
		foreach($events as $event) {
			//$event->Title = $event->EventTitle();
			//$event->EventDate = strip_tags($event->_Dates());
			//$event->EventLocation = $event->Event();
			//$event->EventCost = $event->Cost();
			$event->Title = strip_tags($event->_Dates()) . " : " . $event->EventTitle();
			//$event->Description = strip_tags($event->_Dates()) . $event->EventContent();
			$event->Description = strip_tags($event->EventContent());
		}
		$rss_title = $this->RSSTitle ? $this->RSSTitle : sprintf(_t("Calendar.UPCOMINGEVENTSFOR","Upcoming Events for %s"),$this->Title);
		$rss = new RSSFeed($events, $this->Link(), $rss_title, "", "Title", "Description", "EventDate", "EventLocation");
		
		if(is_int($rss->lastModified)) {
			HTTP::register_modification_timestamp($rss->lastModified);
			header('Last-Modified: ' . gmdate("D, d M Y H:i:s", $rss->lastModified) . ' GMT');
		}
		if(!empty($rss->etag)) {
			HTTP::register_etag($rss->etag);
		}
		$xml = str_replace('&nbsp;', '&#160;', $rss->renderWith('RSSFeed'));
		$xml = preg_replace('/<!--(.|\s)*?-->/', '', $xml);
		$xml = trim($xml);
		HTTP::add_cache_headers();
		header("Content-type: text/xml");
		//echo $xml;
		
 		$Data = array(
	      'Events' => $events
	    );
		
		echo trim(preg_replace('/<!--(.|\s)*?-->/', '', str_replace('&nbsp;', '&#160;', $this->customise($Data)->renderWith(array('AfterClassCategoryRss', 'Page')))));
		return "";
	}
	
 	
 	public function categoriesrss() {
		$events = $this->data()->UpcomingEvents(null,$this->DefaultEventDisplay);
		
		$CategoryName = addslashes($this->urlParams['Category']);
 		$Category = DataObject::get_one("Category", "Title = '".$CategoryName."'");
 		//$Data = array(
	    //  'Category' => $Category
	    //);
		$events = $Category->events();
		
		foreach($events as $event) {
			$event->Title = strip_tags($event->_Dates()) . " : " . $event->EventTitle();
			$event->Description = strip_tags($event->EventContent());
		}
		$rss_title = $this->RSSTitle ? $this->RSSTitle : sprintf(_t("Calendar.UPCOMINGEVENTSFOR","Upcoming Events for %s"),$this->Title);
		$rss = new RSSFeed($events, $this->Link(), $rss_title, "", "Title", "Description", "EventDate", "EventLocation");
		
		if(is_int($rss->lastModified)) {
			HTTP::register_modification_timestamp($rss->lastModified);
			header('Last-Modified: ' . gmdate("D, d M Y H:i:s", $rss->lastModified) . ' GMT');
		}
		if(!empty($rss->etag)) {
			HTTP::register_etag($rss->etag);
		}
		$xml = str_replace('&nbsp;', '&#160;', $rss->renderWith('RSSFeed'));
		$xml = preg_replace('/<!--(.|\s)*?-->/', '', $xml);
		$xml = trim($xml);
		HTTP::add_cache_headers();
		header("Content-type: text/xml");
		//echo $xml;
		
 		$Data = array(
	      'Events' => $events
	    );
		
		echo trim(preg_replace('/<!--(.|\s)*?-->/', '', str_replace('&nbsp;', '&#160;', $this->customise($Data)->renderWith(array('AfterClassCategoryRss', 'Page')))));
		return "";
	}
 	
 	function categories() {
 	
 		$CategoryName = addslashes($this->urlParams['Category']);
 		$Category = DataObject::get_one("Category", "Title = '".$CategoryName."'");
 		$Data = array(
	      'Category' => $Category
	    );
 		return $this->customise($Data)->renderWith(array('AfterClassCategory', 'Calendar', 'Page'));
 	}
 	function category() {
 	    $Category = DataObject::get("Eventtype");
 		$Data = array(
	      'Category' => $Category
	    );
 		return $this->customise($Data)->renderWith(array('AfterClassCategoryList', 'Page'));
 	}
 	function sponsor() {
 	    $Category = DataObject::get("Sponsor");
 		$Data = array(
	      'Category' => $Category
	    );
 		return $this->customise($Data)->renderWith(array('AfterClassCategoryList', 'Page'));
 	}
 	function venue() {
 	    $Category = DataObject::get("Venue");
 		$Data = array(
	      'Category' => $Category
	    );
 		return $this->customise($Data)->renderWith(array('AfterClassCategoryList', 'Page'));
 	}
 	
 	/*function tag() {
	 	if($Tag = $this->getCurrentTag()) {
	            $Data = array(
	                'Tag' => $Tag,
	                'TagTitle' => $Tag->Title,
	                'TaggedEvents' => $Tag->getEvents()
	             );
	              
	            //return our $Data array to use, rendering with the ProductPage.ss template
	            return $this->customise($Data)->renderWith(array('AfterClassCalendar', 'Calendar','Page'));
	        } else { //Product not found
	            return $this->httpError(404, 'Sorry that product could not be found');
	        }
 	}*/
 	public function init() {
		RSSFeed::linkToFeed($this->Link() . "rss", "RSS Feed of this calendar");
		$this->parseURL();
		parent::init();
	}
 
 }