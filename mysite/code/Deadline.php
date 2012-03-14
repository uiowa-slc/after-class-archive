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
		
		$date_field = new DateField('Date');
		$date_field->setConfig('showcalendar', true);
		
		$fields->push( new TextField( 'Title' ) );
		$fields->push( $date_field );
		$fields->push( new TextField( 'LinkURL' ) );
		$fields->push( new TextField( 'Description' ) );


		return $fields;
	}
	
	
	
	function Link(){
	
		$base_url = Director::absoluteBaseURL();
		return $base_url."/events/categories/".$this->Title;
	
	}
	
	
}
