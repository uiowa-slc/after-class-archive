<?php

use SilverStripe\ORM\ArrayList;

class UiCalendarNewsletterController extends PageController {

	public function FeaturedEvents(){
		$calendar = UiCalendar::getOrCreate();
		$feature = new UiCalendarNewsletterFeature();

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

	public function Categories(){
		$categories = new ArrayList();
		$calendar = UiCalendar::getOrCreate();

		for ($i = 1; $i <= 4; $i++) {
			$catProperty = 'Category'.$i;

			$catTitleProp = $catProperty.'Title';
			$catEvent1Prop = $catProperty.'Event1ID';
			$catEvent2Prop = $catProperty.'Event2ID';

			$cat = new UiCalendarNewsletterCategory();

			$cat->CatTitle = $this->{$catTitleProp};
			//print_r($catEvent1Prop);
			$cat->Event1 = $calendar->SingleEvent($this->{$catEvent1Prop});
			$cat->Event2 = $calendar->SingleEvent($this->{$catEvent2Prop});

			$categories->push($cat);
		}

		return $categories;
	}
	public function NonFeaturedRows(){
		$rows = new ArrayList();
		$calendar = UiCalendar::getOrCreate();

		for ($i = 1; $i <= 10; $i++) {
			$rowProperty = 'NonFeaturedRow'.$i;
			$rowEvent1Prop = $rowProperty.'Event1ID';
			$rowEvent2Prop = $rowProperty.'Event2ID';

			$row = new UiCalendarNewsletterNonFeaturedRow();

			//print_r($catEvent1Prop);
			$row->Event1 = $calendar->SingleEvent($this->{$rowEvent1Prop});
			$row->Event2 = $calendar->SingleEvent($this->{$rowEvent2Prop});

			$rows->push($row);
		}

		return $rows;
	}

}