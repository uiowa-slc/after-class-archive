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
	
	function getCMSFields_forPopup() {
		$fields = new FieldList();
		$fields->push( new TextField( 'Title' ) );
		$fields->push( new TextField( 'AltTitle' ) );
		$fields->push( new TextField( 'URLSlug', 'Use underscores for spaces. Do not use dashes.' ) );
		$fields->push( new CheckboxField('Showmenu', 'Show in Main Menu?') );
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

//		print_r($upcomingEventArrayList);

		return $upcomingEventArrayList;

		/*$ids = array();
		$ids = array_merge($ids,$this->AfterClassEvents()->column('ID'));
		$filter = "`CalendarDateTime`.EventID IN (" . implode(',',$ids) . ")";
		$calendar = AfterClassCalendar::get()->First();
		if (empty($ids)) {
			return false;
		} else {
			$events = $calendar->Events($filter,null,null,null,$limit);
			$events->removeDuplicates('EventID');
			return $events;
		}*/

	}
	
	function Link(){
	
		$base_url = Director::absoluteBaseURL();
		return $base_url."events/categories/".$this->Title; 
	}
	
	
}