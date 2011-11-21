<?php
class EventsPage extends Page {

	public static $db = array(
	);
	public static $has_one = array(
	);
	public function getEvent() {
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
	}
	
}
class EventsPage_Controller extends Page_Controller {

	/**
	 * An array of actions that can be accessed via a request. Each array element should be an action name, and the
	 * permissions or conditions required to allow the user to access it.
	 *
	 * <code>
	 * array (
	 *     'action', // anyone can access this action
	 *     'action' => true, // same as above
	 *     'action' => 'ADMIN', // you must have ADMIN permissions to access this action
	 *     'action' => '->checkAction' // you can only access this action if $this->checkAction() returns true
	 * );
	 * </code>
	 *
	 * @var array
	 */
	public static $allowed_actions = array (
	);

	public function init() {
		parent::init();

		// Note: you should use SS template require tags inside your templates 
		// instead of putting Requirements calls here.  However these are 
		// included so that our older themes still work
		Requirements::themedCSS('layout'); 
		Requirements::themedCSS('typography'); 
		Requirements::themedCSS('form'); 
	}
}