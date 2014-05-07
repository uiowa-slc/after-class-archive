<?php
class NearMePage extends Page {

	public static $db = array(
	);
	public static $has_one = array(
	);
	
}
class NearMePage_Controller extends Page_Controller {

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
		      Requirements::block('themes/afterclass2/js/jquery.min.js'); 
		      Requirements::javascript('themes/afterclass2/js/nearby.js');
	}
	
	public function AfterClassEvents(){
		$calendar = AfterClassCalendar::get()->First();
		print_r('hello');
		return $calendar->AllEventsWithoutDuplicates();
	}
	
	public function Venues() {	
		return Venue::get()->sort('Title ASC');
	}
} 

