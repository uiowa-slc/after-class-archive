<?php
class Category extends DataObject {
	private static $db = array(
		"Title" => "Text",
		"AltTitle" => "Text",
		"URLSlug" => "Text",
		"Showmenu" => "Boolean"
	);
	private static $belongs_many_many = array(
		"AfterClassEvents" => "AfterClassEvent"
	);
	
	function getCMSFields_forPopup() {
		$fields = new FieldList();
		$fields->push( new TextField( 'Title' ) );
		$fields->push( new TextField( 'AltTitle' ) );
		$fields->push( new TextField( 'URLSlug', 'Use underscores for spaces. Do not use dashes.' ) );
		$fields->push( new CheckboxField('Showmenu', 'Show in Main Menu?') );
		return $fields;
	}
	
	
	function Events($limit = null) {

		//TODO: Rewrite this function

	}
	
	function Link(){
	
		$base_url = Director::absoluteBaseURL();
		return $base_url."events/categories/".$this->Title; 
	}
	
	
}
