<?php
/**
 * Defines the Orientation Data Collection Model & View Classes
 */
class FeaturedCategory extends DataObject {

	private static $db = array(
		'Title' => 'Text',
		'SearchTerm' => 'Text',
		'SortOrder' => 'Int',
		'UseTagsOnly' => 'Boolean',

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
		$fields->renameField('UseTagsOnly', 'Strict search (events MUST be tagged with the search term)');
		return $fields;
	}

	public function EventList() {
		$calendar = LocalistCalendar::get()->First();

		if ($this->UseTagsOnly) {
			$events = $calendar->EventList(
				$days = '200',
				$startDate = null,
				$endDate = null,
				$venue = null,
				$keyword = $this->SearchTerm,
				$type = null,
				$distinct = 'true',
				$enableFilter = true,
				$searchTerm = null
			);
		} else {

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

		}
		if (isset($events)) {
			$events->removeDuplicates();
			return $events;
		}
	}
}
?>