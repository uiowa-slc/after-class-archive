<?php
class EventsPage extends Page {
	public static $db = array(
	);
	public static $has_one = array(
	);
	static $has_many = array(
		//'Events' => 'Event'
	);
	function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->removeFieldFromTab('Root.Content', 'Content'); // remove a field from a tab
		
		/*$tablefield = new DataObjectManager(
			$this,
			'Events', // the name of the relationship
			'Event', // the related table 
			array(
				"Title" => "Title"
			),
			'getCMSFields_forPopup' // the function to build the add/edit form
		);
		$fields->addFieldToTab( 'Root.Content.Features', $tablefield );*/
		
		return $fields;
	}
	
}
class EventsPage_Controller extends Page_Controller {
	public static $allowed_actions = array (
	);
	public function init() {
		parent::init();
	}
}