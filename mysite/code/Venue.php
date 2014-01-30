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
		$fields->push( /*
### @@@@ UPGRADE REQUIRED @@@@ ###
FIND: new HtmlEditorField
NOTE:  $form, $maxLength, $rightTitle, $rows/$cols optional constructor arguments must now be set using setters on the instance of the field.  
### @@@@ ########### @@@@ ###
*/new HtmlEditorField( 'Information' ) );
		$fields->push( new TextField('Address') );
		$fields->push( new TextField('Email', 'Contact Email Address') );
		$fields->push( new TextField('Phone', 'Phone Number') );
		$fields->push( new TextField('WebsiteURL','Website Address') );
		$fields->push( new TextField('Lat') );
		$fields->push( new TextField('Lng') );
		return $fields;
	}
	
}
