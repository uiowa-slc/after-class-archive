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
            'categories/$Category' => 'categories'
            );
 	static $allowed_actions = array ();
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
 	
 	function categories() {
 		$Category = DataObject::get_one("Category", "Title = '".$this->urlParams['Category']."'");
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