<?php
class EventsPage extends Page {
	public static $db = array(
	);
	public static $has_one = array(
	);
	static $has_many = array(
	);
	function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->removeFieldFromTab('Root.Content', 'Content'); // remove a field from a tab
		
		return $fields;
	}
	
}
class EventsPage_Controller extends Page_Controller {
	public static $allowed_actions = array (
	);
	public function init() {
		parent::init();
	}
	function addEventForm() {
		$fields = new FieldSet(
            new TextField('Title'),
            new TextField('Location'),
            new TextField('Cost'),
            new TextField('Description'),
            new TextField('')
        );
        $actions = new FieldSet(
            new FormAction('addEvent', 'Submit')
        );
        $validator = new RequiredFields('Title','Location','Cost','Description');
     
        return new Form($this, 'addEventForm', $fields, $actions, $validator);
	}
	function addEvent($data, $form) {
		$event = new AfterClassEvent();
        $form->saveInto($event);
        $event->write();
        Director::redirectBack();
		
	}
}