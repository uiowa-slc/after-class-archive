<?php
use SilverStripe\CMS\Controllers\ContentController;
use SilverStripe\View\Requirements;
use SilverStripe\Core\Config\Config;
use Symbiote\QueuedJobs\Services\QueuedJobService;
use SilverStripe\Core\Cache\DefaultCacheFactory;
use SilverStripe\Control\HTTPRequest;
class CalendarEventController extends PageController {

	protected function init() {
		parent::init();
		//Block all requirements because we're building them with grunt now.
		// Requirements::block('event_calendar/css/calendar_widget.css');
		// Requirements::block('event_calendar/css/calendar.css');
		// Requirements::block('division-bar/js/_division-bar.js');
		// Requirements::block('framework/thirdparty/jquery/jquery.js');
		// Requirements::block('event_calendar/javascript/calendar.js');
		// Requirements::block('event_calendar/javascript/calendar_widget.js');
		// Requirements::block('event_calendar/javascript/lang/calendar_en.js');
		// Requirements::block('event_calendar/javascript/calendar_widget_init.js');
	
 	}
	
	 public function index(HTTPRequest $request){

	 	//Check to see if there's an existing UiCalendar event associated with this event and redirect to that if needed.
	 	if($this->UiCalendarEventId != 0){

		 	$calendar = UiCalendar::getOrCreate();
		 	$eventTest = $calendar->SingleEvent($this->UiCalendarEventId);

		 	if($eventTest){
		 		return $this->redirect($eventTest->Link());
		 	}

	 	}

	 	return parent::index($request);

	 }
}
