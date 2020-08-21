<?php

use SilverStripe\Assets\Image;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\ORM\DataExtension;
use SilverStripe\ORM\ArrayList;
use SilverStripe\Forms\CheckboxField;

class UiCalendarExtension extends DataExtension {
	private static $db = array(
		'ShowSocialCalendar' => 'Boolean'

	);
	private static $has_one = array(


	);
	private static $belongs_many_many = array(

	);

	public function updateCMSFields(FieldList $fields){


		$fields->removeByName('BackgroundImage');
		$fields->removeByName('EventTypeFilterID');
		$fields->removeByName('DepartmentFilterID');
		$fields->removeByName('VenueFilterID');
		$fields->removeByName('GeneralInterestFilterID');
		$fields->removeByName('KeywordFilterID');
		$fields->removeByName('LayoutType');
		// $fields->removeByName('Content');
		$fields->removeByName('YoutubeBackgroundEmbed');
		$fields->addFieldToTab('Root.Main' , new CheckboxField('ShowSocialCalendar','Show the social media calendar?'), 'Content');
		return $fields;

	}

	public function SocialEventList($sort = null){
		$eventList = new ArrayList();
		$calendar = Calendar::get()->First();
		if($calendar){
			$eventList = $calendar->EventList();
		}
		if($sort = "shuffled")
			$eventList->shuffle();

		// print_r($eventList);

		return $eventList;
	}

	//Combines the event list
	public function CombinedEventList(){

        $uiEvents = new ArrayList();
        $socialEvents = new ArrayList();
        $combinedEvents = new ArrayList();
        $socialEventsNoDups = new ArrayList();
        $duplicateEventIds = array();

        $uiEvents = $this->owner->EventList("threemonths");

        $socialEvents = $this->SocialEventList();


        foreach($socialEvents as $socialEvent){
            $id = $socialEvent->UiCalendarEventId;
            $uiEventTest = $uiEvents->filter(array('ID' => $id))->First();
            if($uiEventTest){
                $duplicateEventIds[] = $id;
            }
        }
        $socialEventsNoDups = $socialEvents->exclude(array('UiCalendarEventId' => $duplicateEventIds));


        $combinedEvents->merge($socialEventsNoDups);
        $combinedEvents->merge($uiEvents);

        return $combinedEvents;


	}

}
