<?php
class Sponsor extends Category {
	private static $belongs_many_many = array(
		"AfterClassEvents" => "AfterClassEvent"
	);
	private static $db = array(
		"Information" => "HTMLText",
		"LinkURL" => "Text",
		
	);
	
	private static $has_one = array(
		'LogoImage' => "Image"
	);
	
	function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->push( new TextField('LinkURL', 'Website Address') );
		$fields->push( new HtmlEditorField( 'Information' ) );
		$fields->push( new UploadField('LogoImage','Sponsor Logo Image'));
		return $fields;
	}
	
}
