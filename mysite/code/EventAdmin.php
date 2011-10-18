<?php
class EventsCalendarAdmin extends RemodelAdmin {

	static $managed_models = array (
		'CalendarEvent'
	);

	static $url_segment = "events";

	static $parent = "events";
}
