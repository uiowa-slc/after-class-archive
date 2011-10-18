<?php

class AfterClassEvent extends CalendarEvent
{
	
	static $many_many = array (
	
		"EventCategories" => "EventCategory"

	);

		
	public function getCMSFields()
	{
		$f = parent::getCMSFields();
		
		$f->addFieldToTab("Root.Content.Main", new CheckboxSetField( $name = "EventCategories", $title = "Pick a category?"));
		
		$f->addFieldToTab("Root.Content.Categories", new DataObjectManager(
			$this,
			'EventCategories',
			'EventCategory',
			array('Title' => 'Title'),
			'getCMSFields_forPopup'
		));
		
		return $f;
	
	}
}	
	class AfterClassEvent_Controller extends CalendarEvent_Controller
	{



	
	
}