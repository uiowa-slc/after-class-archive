<?php
class Category extends DataObject {
	public static $db = array(
		"Title" => "Varchar(155)",
		"Showmenu" => "Boolean"
	);
	function getCMSFields_forPopup() {
		$fields = new FieldSet();
		$fields->push( new TextField( 'Title' ) );
		$fields->push( new CheckboxField('Showmenu') );
		return $fields;
	}
}
