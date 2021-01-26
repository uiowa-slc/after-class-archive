<?php
use SilverStripe\Control\Controller;
use SilverStripe\ORM\DataObject;
use SilverStripe\ORM\FieldType\DBDatetime;
use SilverStripe\ORM\FieldType\DBTime;

class CalendarDateTime extends DataObject {

	private static $db = array(
		'StartDate' => 'Date',
		'StartTime' => 'Time',
		'EndDate' => 'Date',
		'EndTime' => 'Time',
		'AllDay' => 'Boolean',
	);

	private static $has_one = array(
		'Event' => 'CalendarEvent',
	);

	private static $summary_fields = array(
		'StartDate.Nice',
		'StartTime',
		'EndDate',
		'EndTime',
		'AllDay',
	);

	private static $casting = array(
		'StartDateTime' => 'DBDatetime',
		'EndTime' => 'DBTime',
	);

	private static $default_sort = "StartDate ASC, StartTime ASC";

	public function getStartDateTime() {

		if ($this->StartDate && $this->StartTime) {
			$startDateTime = new DBDatetime();
			$startDateTime->setValue($this->StartDate . ' ' . $this->StartTime);
			return $startDateTime;
		}

		return false;
	}

	public function getEndTime() {

		if ($this->EndDateTime) {

			$endTime = new DBTime();
			$endTime->setValue($this->EndDateTime->Format('H:i:s'));
			return $endTime;

		} else {
			return false;
		}

	}
	public function EndDateTime() {
		if ($this->EndDate && $this->EndTime) {

			$endDateTime = new DBDatetime();
			$endDateTime->setValue($this->EndDate . ' ' . $this->EndTime);
			//print_r($startDateTime);
			//echo 'hello';
			return $endDateTime;
		}
		return false;
	}
	public function ICSLink() {
		$ics_start = $this->obj('StartDate')->Format('YMMdd') . "T" . $this->obj('StartTime')->Format('HHmmss');
		if ($this->EndDate) {
			$ics_end = $this->obj('EndDate')->Format('YMMdd') . "T" . $this->obj('EndTime')->Format('HHmmss');
		} else {
			$ics_end = $ics_start;
		}
		if ($this->Feed) {
			return Controller::join_links(
				$this->Calendar()->Link(),
				"ics",
				$this->ID,
				$ics_start . "-" . $ics_end,
				"?title=" . urlencode($this->Title)
			);
		}

		return Controller::join_links(
			$this->Event()->Parent()->Link(),
			"ics",
			$this->Event()->ID,
			$ics_start . "-" . $ics_end
		);
	}
}
