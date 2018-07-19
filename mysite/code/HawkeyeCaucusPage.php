<?php

use SilverStripe\Forms\Form;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\HiddenField;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\FormAction;
use SilverStripe\Forms\RequiredFields;
use SilverStripe\Security\Permission;
use SilverStripe\Control\Controller;
use SilverStripe\View\Requirements;

class HawkeyeCaucusPage extends Page {

	private static $db = array(
	);
	private static $has_one = array(
	);
	
	
}
class HawkeyeCaucusPage_Controller extends PageController {

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
	private static $allowed_actions = array (
		Form::class
	);
	
	public function Form() {
		//
		$myForm = new Form($this, Form::class, new FieldList(
			new TextField("first_name", "Your First Name"),
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
		$hawkeyeCaucusPerson = new HawkeyeCaucusPerson();
		$form->saveInto($hawkeyeCaucusPerson);
		$hawkeyeCaucusPerson->signup_source = $this->URLSegment;
		$hawkeyeCaucusPerson->write();
		/*
		******* need to check this formating ******
		*/
		//$this->redirect($this->URLSegment.'/');
	}
	public function show() {
		if(Permission::check("ADMIN")){
			if($this){
				$mr = "first,last,email,signupsource,created<br />";
				$records = HawkeyeCaucusPerson::get()->sort("DESC")->limit(3000);
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
		$themeFolder = $this->ThemeDir();
		
		Requirements::block($themeFolder . '/css/layout.css');

	}
	
}