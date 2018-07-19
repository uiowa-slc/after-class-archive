<?php

use SilverStripe\Control\Session;
use SilverStripe\Assets\Image;
use SilverStripe\Forms\FileField;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\TextareaField;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\FormAction;
use SilverStripe\Forms\RequiredFields;
use SilverStripe\Forms\Form;
use SilverStripe\Control\Email\Email;
use SilverStripe\Control\Controller;


class AddEventPage extends Page {
	private static $db = array(
	
	);
	private static $has_one = array(
	);
	private static $has_many = array(
	);
	public function getCMSFields() {
		$fields = parent::getCMSFields();
		//$fields->removeFieldFromTab('Root.Content', 'Content'); // remove a field from a tab
		
		return $fields;
	}
	
}
