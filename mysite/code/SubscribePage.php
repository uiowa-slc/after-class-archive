<?php
class SubscribePage extends Page {

	public static $db = array(
	);
	public static $has_one = array(
	);
	

	public function getCMSFields()
	{
		$f = parent::getCMSFields();
		/*$f->addFieldToTab("Root.Main", new DataObjectManager(
			$this,
			'Deadlines',
			'Deadline',
			array('Date' => 'Date','Title'=>'Title','Description' => 'Description', 'LinkURL' => 'LinkURL'),
			'getCMSFields_forPopup'
		));*/
		return $f;
	}
 
	

}
class SubscribePage_Controller extends Page_Controller {
	public static $allowed_actions = array (
	);
	
	
	
	
	public function init() {
		parent::init();
			}
	}