<?php
class Orientation2012Page extends Page {

	public static $db = array(
	);
	public static $has_one = array(
	);
	
}
class Orientation2012Page_Controller extends Page_Controller {

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
	
function Form() {
		//
		$myForm = new Form($this, "Form", new FieldList(
			new TextField("first_name", "First Name"),
			new TextField("last_name","Last Name"),
			new TextField("email","Email Address"),
 			new HiddenField("facebook_id")
		), new FieldList(
			new FormAction("SignupAction","Get Connected!")
		), new RequiredFields());
		$myForm->disableSecurityToken();
		return $myForm;
	}
 
	/**
	* This function is called when the user submits the form.
	*/
	function SignupAction($data, $form) {
		$orientationPerson = new OrientationPerson();
		$form->saveInto($orientationPerson);
		$orientationPerson->signup_source = $this->URLSegment;
		$orientationPerson->write();
		Controller::curr()->redirect($this->URLSegment.'/');
	}
	public function show() {
	
	if(Permission::check("ADMIN")){
		if($this){
			$mr = OrientationPerson::get()->sort('DESC')->limit(3000);
			foreach ($records as $record) {
				if ($record->signup_source == $this->URLSegment) {
					$mr = $mr . $record->first_name . "," . $record->last_name . "," . $record->email . "," . $record->signup_source . "," . $record->Created . "<br />";
				}
			}
			return $mr;
		}
	}else {
		Controller::curr()->redirect("home/");
	
	}
}


	public function init() {
		parent::init();

	}
	
	/*public function Form() {
		$form = parent::Form();
		
		
	
	}*/
	
	
}