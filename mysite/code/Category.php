<?php
class Category extends DataObject {
	public static $db = array(
		"Title" => "Varchar(155)"
	);
	public static $belongs_many_many = array(
		"AfterClassEvents" => "AfterClassEvent"
	);
	function getCMSFields_forPopup() {
		$fields = new FieldSet();
		$fields->push( new TextField( 'Title' ) );
		return $fields;
	}
}
