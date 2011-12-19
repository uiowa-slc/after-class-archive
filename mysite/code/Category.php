<?php
class Category extends DataObject {
	public static $db = array(
		"Title" => "Varchar(155)",
		"Showmenu" => "Boolean"
	);
	function getCMSFields_forPopup() {
		$fields = new FieldSet();
		$fields->push( new TextField( 'Title' ) );
		$fields->push( new CheckboxField('Showmenu') );
		return $fields;
	}
	
	function Events() {
		$ids = array();
		// Get IDs of all events in this category.
		$ids = array_merge($ids,$this->AfterClassEvents()->column('ID'));
		// Setup filter
		$filter = "`CalendarDateTime`.EventID IN (" . implode(',',$ids) . ")";
		// Get the calendar
		$calendar = DataObject::get_one("AfterClassCalendar");
		// Get the events from the calendar
		return $calendar->Events($filter);
	}
	
}
