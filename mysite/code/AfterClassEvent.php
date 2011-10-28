<?php

class AfterClassEvent extends CalendarEvent
{
	
	static $many_many = array (
	
		"Tags" => "Tag"

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
		
		$f->addFieldToTab("Root.Content.Tags", new TagField('Tags', 'My Tags', null, 'AfterClassEvent', 'Title'));
		
		return $f;
	
	}
}	
	class AfterClassEvent_Controller extends CalendarEvent_Controller
	{



	
	
}