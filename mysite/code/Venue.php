<?php
class Venue extends Category {
	private static $db = array(
		"Information" => "HTMLText",
		"Address" => "Varchar(255)",
		"Email" => "Varchar(255)",
		"Phone" => "Varchar(255)",
		"WebsiteURL" => "Text",
		"Lat" => "Varchar(255)",
		"Lng" => "Varchar(255)",
	);
	
	private static $belongs_many_many = array(
		"AfterClassEvents" => "AfterClassEvent"
	);
	
	function getCMSFields() {
		$fields = parent::getCMSFields();
		
		$fields->push( new TextField('Address') );
		$fields->push( new TextField('Email', 'Contact Email Address') );
		$fields->push( new TextField('Phone', 'Phone Number') );
		$fields->push( new TextField('WebsiteURL','Website Address') );
		$fields->push( new TextField('Lat', 'Latitude') );
		$fields->push( new TextField('Lng', 'Longitude') );
		$fields->push( new HtmlEditorField( 'Information' ) );
		return $fields;
	}

	public function DirectionsLink(){
		return "http://maps.apple.com/?q=".$this->Address;
	}
	
}
