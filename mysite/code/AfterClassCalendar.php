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