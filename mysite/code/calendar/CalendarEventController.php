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

        if($this->UiCalendarEventId != 0){

            $calendar = UiCalendar::getOrCreate();
            $eventTest = $calendar->SingleEvent($this->UiCalendarEventId);

            if($eventTest){
                return $this->redirect($eventTest->Link());
            }

        }



 	}

}
