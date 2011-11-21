<?php

class AfterClassEvent extends CalendarEvent {
	static $many_many = array (
		//"Tags" => "Tag",
		"Categories" => "Category"
	);
	
	public function getCMSFields() {
		$f = parent::getCMSFields();
		$categoriesTablefield = new ManyManyComplexTableField(
        	$this,
        	'Categories',
        	'Category',
        	array(
       		'Title' => 'Title'
        	),
        	'getCMSFields_forPopup'
      	);
		$categoriesTablefield->setAddTitle( 'A Category' );
		$f->addFieldToTab( 'Root.Content.Categories', $categoriesTablefield );
		
		return $f;
	}
}

class AfterClassEvent_Controller extends CalendarEvent_Controller {
	
}