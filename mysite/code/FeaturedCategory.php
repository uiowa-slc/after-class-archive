<?php
/**
 * Defines the Orientation Data Collection Model & View Classes
 */
class FeaturedCategory extends DataObject {

	private static $db = array(
		'Title' => 'Text',
		'SearchTerm' => 'Text',
		'SortOrder' => 'Int',

	);
	private static $has_one = array(
		'LocalistCalendar' => 'LocalistCalendar',
	);

	private static $field_labels = array(

	);

	private static $summary_fields = array(
		'Title', 'SearchTerm',

	);

	public function canView($member = null) {
		return Permission::check('ADMIN');
	}

	function getCMSFields() {
		$fields = parent::getCMSFields();
		return $fields;
	}

	public function EventList() {
		$calendar = LocalistCalendar::get()->First();

		$events = $calendar->EventList(
			$days = '200',
			$startDate = null,
			$endDate = null,
			$venue = null,
			$keyword = null,
			$type = null,
			$distinct = 'true',
			$enableFilter = true,
			$searchTerm = $this->SearchTerm
		);

		return $events;

	}
}
?>