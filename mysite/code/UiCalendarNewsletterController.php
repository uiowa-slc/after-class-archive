<?php

class UiCalendarNewsletterController extends PageController {

	public function FeaturedEvent(){
		$calendar = UiCalendar::getOrCreate();
		$feature = new UiCalendarNewsletterFeature();
		$event = $calendar->SingleEvent($this->FeaturedEventID);

		
		$feature->Event = $event;
		$feature->Summary = $this->FeaturedEventSummary;
		//print_r($event);

		return $feature;

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