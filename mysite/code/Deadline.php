<?php
class Deadline extends DataObject {
	public static $db = array(
		"Title" => "Text",
		"Description" => "HTMLText",
		"Date" => "Date",
		"LinkURL" => "Text"
	);
	function getCMSFields_forPopup() {
		$fields = new FieldSet();
		
		$date_field = new DateField('Date', 'Deadline Date');
		$date_field->setConfig('showcalendar', true);
		
		$fields->push( new TextField( 'Title', 'Title of the Deadline (example: "Dance Marathon Signup!"' ) );
		$fields->push( $date_field );
		$fields->push( new TextField( 'LinkURL', 'More information link (this is almost ALWAYS required)' ) );
		$fields->push( new TextField( 'Description', 'A short description of the deadline (example: All dancers must be signed up for Dance Marathon!)' ) );


		return $fields;
	}
	
	
	
	function Link(){
	
		$base_url = Director::absoluteBaseURL();
		return $base_url."/events/categories/".$this->Title;
	
	}
	
	
}
