<?php
class ConnectPage extends Page {
	public static $db = array(
		'FB1' => 'Text',
		'FB2' => 'Text',
		'FB3' => 'Text',
		'FB4' => 'Text',
		'FB5' => 'Text',
		'FB6' => 'Text',
		'FB7' => 'Text',
		'FB8' => 'Text',
		'FB9' => 'Text',
		'FB10' => 'Text',
		'FB11' => 'Text',
		'FB12' => 'Text',
		'Twitter1' => 'Text',
		'Twitter2' => 'Text',
		'Twitter3' => 'Text',
		'Twitter4' => 'Text',
		'Twitter5' => 'Text',
		'Twitter6' => 'Text',
		'Twitter7' => 'Text',
		'Twitter8' => 'Text',
		'Twitter9' => 'Text',
		'Twitter10' => 'Text',
		'Twitter11' => 'Text',
		'Twitter12' => 'Text',
		'TwitterTitle1' => 'Text',
		'TwitterTitle2' => 'Text',
		'TwitterTitle3' => 'Text',
		'TwitterTitle4' => 'Text',
		'TwitterTitle5' => 'Text',
		'TwitterTitle6' => 'Text',
		'TwitterTitle7' => 'Text',
		'TwitterTitle8' => 'Text',
		'TwitterTitle9' => 'Text',
		'TwitterTitle10' => 'Text',
		'TwitterTitle11' => 'Text',
		'TwitterTitle12' => 'Text'
	);
	public static $has_one = array(
	);
	static $has_many = array(
	);
	function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->addFieldToTab('Root.Main', new TextField( 'FB1', 'Facebook' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'FB2', 'Facebook' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'FB3', 'Facebook' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'FB4', 'Facebook' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'FB5', 'Facebook' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'FB6', 'Facebook' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'FB7', 'Facebook' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'FB8', 'Facebook' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'FB9', 'Facebook' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'FB10', 'Facebook' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'FB11', 'Facebook' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'FB12', 'Facebook' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'TwitterTitle1', 'Twitter Title' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'Twitter1', 'Twitter' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'TwitterTitle2', 'Twitter Title' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'Twitter2', 'Twitter' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'TwitterTitle3', 'Twitter Title' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'Twitter3', 'Twitter' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'TwitterTitle4', 'Twitter Title' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'Twitter4', 'Twitter' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'TwitterTitle5', 'Twitter Title' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'Twitter5', 'Twitter' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'TwitterTitle6', 'Twitter Title' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'Twitter6', 'Twitter' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'TwitterTitle7', 'Twitter Title' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'Twitter7', 'Twitter' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'TwitterTitle8', 'Twitter Title' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'Twitter8', 'Twitter' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'TwitterTitle9', 'Twitter Title' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'Twitter9', 'Twitter' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'TwitterTitle10', 'Twitter Title' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'Twitter10', 'Twitter' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'TwitterTitle11', 'Twitter Title' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'Twitter11', 'Twitter' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'TwitterTitle12', 'Twitter Title' ) );
		$fields->addFieldToTab('Root.Main', new TextField( 'Twitter12', 'Twitter' ) );
		
		return $fields;
	}
	
}
class ConnectPage_Controller extends Page_Controller {
	public static $allowed_actions = array (
	);
	public function init() {
		parent::init();
	}
}