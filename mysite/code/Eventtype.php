<?php
class Eventtype extends Category {

	private static $belongs_many_many = array(
		"AfterClassEvents" => "AfterClassEvent"
	);
	
	private static $db = array(
		"Information" => "HTMLText",
		"LinkURL" => "Text"
	);
	
	function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->push( new TextField('LinkURL', 'Website Address') );
		$fields->push( new HtmlEditorField( 'Information' ) );
		return $fields;
	}
}