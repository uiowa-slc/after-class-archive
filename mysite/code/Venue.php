<?php
class Venue extends Category {
	public static $belongs_many_many = array(
		"AfterClassEvents" => "AfterClassEvent"
	);
	public static $db = array(
		"Information" => "HTMLText",
		"Address" => "Varchar(255)"
	);
	function getCMSFields_forPopup() {
		$fields = parent::getCMSFields_forPopup();
		$fields->push( new SimpleHTMLEditorField( 'Information' ) );
		$fields->push( new TextField('Address') );
		return $fields;
	}
}
