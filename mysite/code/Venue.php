<?php
class Venue extends Category {
	public static $belongs_many_many = array(
		"AfterClassEvents" => "AfterClassEvent"
	);
	public static $db = array(
		"Information" => "HTMLText",
		"Address" => "Varchar(255)",
		"Email" => "Varchar(255)",
		"Phone" => "Varchar(255)",
		"WebsiteURL" => "Text",
		"Lat" => "Varchar(255)",
		"Lng" => "Varchar(255)",
		
	);
	function getCMSFields_forPopup() {
		$fields = parent::getCMSFields_forPopup();
		$fields->push( new HTMLEditorField( 'Information' ) );
		$fields->push( new TextField('Address') );
		$fields->push( new TextField('Email', 'Contact Email Address') );
		$fields->push( new TextField('Phone', 'Phone Number') );
		$fields->push( new TextField('WebsiteURL','Website Address') );
		$fields->push( new TextField('Lat') );
		$fields->push( new TextField('Lng') );
		return $fields;
	}
	
}
