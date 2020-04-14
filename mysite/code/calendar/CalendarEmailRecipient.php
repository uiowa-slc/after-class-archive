<?php
use SilverStripe\ORM\DataObject;
class CalendarEmailRecipient extends DataObject{

	private static $db = array(
		'EmailAddress' => 'Text'
	);

	private static $belongs_many_many = array(
		'Calendars' => 'Calendar'
	);

	public function Title(){
		return $this->EmailAddress;
	}

}

