<?php

use SilverStripe\Security\Permission;
use SilverStripe\ORM\DataObject;

/**
 * Defines the Orientation Data Collection Model & View Classes
 */
class OrientationPerson extends DataObject {
   
	private static $db = array(
		"first_name" => "Varchar(255)",
		"last_name" => "Varchar(255)",
		"email" => "Varchar(255)",
		"facebook_id" => "Int",
		"signup_source" => "Varchar(255)"
		);
	private static $has_one = array(					 
	);  
	
	private static $field_labels = array(
		'ID' => 'Name'
	);
	
	private static $summary_fields = array (
		'first_name',
		'last_name',
		'email',
		'Created',
		
	);
	
    public function canView($member = null) {
        return Permission::check('ADMIN');
    }
	
	function getCMSFields() {
		$fields = parent::getCMSFields();
		return $fields;
   }}