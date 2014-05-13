<?php
class Category extends DataObject {
	private static $db = array(
		"Title" => "Text",
		"AltTitle" => "Text",
		"URLSlug" => "Text",
		"Showmenu" => "Boolean"
	);
	private static $belongs_many_many = array(
	);
	
	function getCMSFields() {
		$fields = new FieldList();
		$fields->push( new TextField( 'Title' ) );
		return $fields;
	}
	
	
	public function Events($limit = null) {

		$eventArrayList = new ArrayList($this->AfterClassEvents()->toArray());
		$upcomingEventArrayList = new ArrayList();

		foreach($eventArrayList as $event){
			$upcomingDatesAndRanges = $event->UpcomingDatesAndRanges();

			if($upcomingDatesAndRanges->exists()){
				$upcomingEventArrayList->push($event);
			}
		}
		return $upcomingEventArrayList;
	}

	public function JsonFeedLink(){
		$base_url = Director::absoluteBaseURL();
		return $base_url."events/categories/".$this->ID.'/feed/json'; 
	}
	
	function Link(){
		$base_url = Director::absoluteBaseURL();
		return $base_url."events/categories/".$this->Title; 
	}
	
	
}
