<?php

use SilverStripe\ORM\ArrayList;

class UiCalendarNewsletterController extends PageController {

	public function FeaturedEvents(){
		$calendar = UiCalendar::getOrCreate();
		$eventList = new ArrayList();



		$event1 = $calendar->SingleEvent($this->Event1);
		if($event1)
		$eventList->push($event1);

		$event2 = $calendar->SingleEvent($this->Event2);

		if($event2)
		$eventList->push($event2);

		$event3 = $calendar->SingleEvent($this->Event3);
		if($event3)
		$eventList->push($event3);

		$event4 = $calendar->SingleEvent($this->Event4);
		if($event4)
		$eventList->push($event4);

		$event5 = $calendar->SingleEvent($this->Event5);
		if($event5)
		$eventList->push($event5);

		$event6 = $calendar->SingleEvent($this->Event6);
		if($event6)
		$eventList->push($event6);

		$event7 = $calendar->SingleEvent($this->Event7);
		if($event7)
		$eventList->push($event7);

		$event8 = $calendar->SingleEvent($this->Event8);
		if($event8)
		$eventList->push($event8);

		// print_r($eventList);

		return $eventList;

	}
	public function NonFeaturedEvents(){
		$calendar = UiCalendar::getOrCreate();
		$eventList = new ArrayList();



		$event1 = $calendar->SingleEvent($this->NonFeaturedEvent1);
		if($event1)
		$eventList->push($event1);

		$event2 = $calendar->SingleEvent($this->NonFeaturedEvent2);

		if($event2)
		$eventList->push($event2);

		$event3 = $calendar->SingleEvent($this->NonFeaturedEvent3);
		if($event3)
		$eventList->push($event3);

		$event4 = $calendar->SingleEvent($this->NonFeaturedEvent4);
		if($event4)
		$eventList->push($event4);

		$event5 = $calendar->SingleEvent($this->NonFeaturedEvent5);
		if($event5)
		$eventList->push($event5);

		$event6 = $calendar->SingleEvent($this->NonFeaturedEvent6);
		if($event6)
		$eventList->push($event6);

		$event7 = $calendar->SingleEvent($this->NonFeaturedEvent7);
		if($event7)
		$eventList->push($event7);

		$event8 = $calendar->SingleEvent($this->NonFeaturedEvent8);
		if($event8)
		$eventList->push($event8);

		// print_r($eventList);

		return $eventList;

	}

}