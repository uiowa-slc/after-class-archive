<?php

use SilverStripe\ORM\DataObject;

/**
 * Defines the Orientation Data Collection Model & View Classes
 */
class HawkeyeCaucusPerson extends DataObject {
   
	private static $db = array(
		"first_name" => "Varchar",
		"last_name" => "Varchar",
		"email" => "Varchar",
		"facebook_id" => "Int",
		"signup_source" => "Varchar"
		);
	private static $has_one = array(					 
	);  
	public function getCMSFields() {
		$fields = parent::getCMSFields();
		return $fields;
   }}
