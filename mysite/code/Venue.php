<?php
class Venue extends Category {
	public static $belongs_many_many = array(
		"AfterClassEvents" => "AfterClassEvent"
	);
	public static $db = array(
		"Information" => "HTMLText",
		"LinkURL" => "Text",
		"Address" => "Text"
	);
	function getCMSFields_forPopup() {
		$fields = parent::getCMSFields_forPopup();
		$fields->push( new TextField('LinkURL', 'Website Address') );
		$fields->push( new TextField('Address', 'Physical Location/Address') );
		$fields->push( new SimpleHTMLEditorField( 'Information' ) );
				return $fields;
	}
}
