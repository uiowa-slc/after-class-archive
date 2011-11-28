<?php
class EventsPage extends Page {
	public static $db = array(
	);
	public static $has_one = array(
	);
	static $has_many = array(
		'Events' => 'Event'
	);
	/*public function getEvent() {
		$Params = $this->getURLParams();
        
        if(is_numeric($Params['ID']) && $Event = DataObject::get_by_id('Event', (int)$Params['ID'])) {       
            return $Event;
        }
	}
	function show() {
		if($Event = $this->getEvent()) {
            $Data = array(
                'Event' => $Event
            );
            //return our $Data array to use on the page
            return $this->Customise($Data);
        } else {
            //Staff member not found
            return $this->httpError(404, 'Sorry that event could not be found.');
        }
	}
	public function getTag() {
		$Params = $this->getURLParams();
         
        if(is_numeric($Params['ID']) && $Event = DataObject::get_by_id('Event', (int)$Params['ID'])) {       
            return $StaffMember;
        }
	}*/
	function getCMSFields() {
		$fields = parent::getCMSFields();
		// remove a field from a tab
		$fields->removeFieldFromTab('Root.Content', 'Content');
		$tablefield = new DataObjectManager(
			$this,
			'Events', // the name of the relationship
			'Event', // the related table 
			array(
				"Title" => "Title"
			),
			'getCMSFields_forPopup' // the function to build the add/edit form
		);
		$fields->addFieldToTab( 'Root.Content.Features', $tablefield );
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