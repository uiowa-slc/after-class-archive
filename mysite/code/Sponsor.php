<?php
class Sponsor extends Category {
	public static $belongs_many_many = array(
		"AfterClassEvents" => "AfterClassEvent"
	);
	public static $db = array(
		"Information" => "HTMLText",
		"LinkURL" => "Text"
	);
	
	function getCMSFields_forPopup() {
		$fields = parent::getCMSFields_forPopup();
		$fields->push( new TextField('LinkURL', 'Website Address') );
		$fields->push( /*
### @@@@ UPGRADE REQUIRED @@@@ ###
FIND: new HtmlEditorField
NOTE:  $form, $maxLength, $rightTitle, $rows/$cols optional constructor arguments must now be set using setters on the instance of the field.  
### @@@@ ########### @@@@ ###
*/new HtmlEditorField( 'Information' ) );
		return $fields;
	}
	
}
