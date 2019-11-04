<?php

use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Forms\LabelField;
use SilverStripe\Forms\TextField;
class UiCalendarNewsletter extends Page {

	private static $db = array(

		'Event1' => 'Int',
		'Event2' => 'Int',
		'Event3' => 'Int',
		'Event4' => 'Int',
		'Event5' => 'Int',
		'Event6' => 'Int',
		'Event7' => 'Int',
		'Event8' => 'Int',

		'NonFeaturedEvent1' => 'Int',
		'NonFeaturedEvent2' => 'Int',
		'NonFeaturedEvent3' => 'Int',
		'NonFeaturedEvent4' => 'Int',
		'NonFeaturedEvent5' => 'Int',
		'NonFeaturedEvent6' => 'Int',
		'NonFeaturedEvent7' => 'Int',
		'NonFeaturedEvent8' => 'Int',
	);

	private static $has_one = array(

	);

	private static $default_sort = 'Created DESC';

	private static $defaults = array (

	);
	private static $singular_name = 'Newsletter';

	private static $plural_name = 'Newsletters';
	private static $summary_fields = array(
		'Title',
		'Created'

	);
    private static $show_in_sitetree = false;
    private static $allowed_children = [];

    public function summaryFields()
    {
    	return array('Title', 'Created');
    }
	public function getCMSFields() {
		$fields = parent::getCMSFields();
		$calendar = UiCalendar::getOrCreate();
		$fields->removeByName('Content');
		$fields->removeByName('Content');
		$fields->removeByName('Metadata');
		$fields->removeByName('LayoutType');
		$fields->removeByName('BackgroundImage');
		$events = $calendar->EventList();

		if ($events->First()) {
			$eventsArray = $events->map()->toArray();

			foreach($eventsArray as $eventKey => $eventVal){

				
				$eventObj = $events->filter(array('ID' => $eventKey))->First();

				if($eventObj->Dates->First()){

					$eventFirstDateTime = $eventObj->Dates->First()->StartDateTime->Nice();
					$eventsArray[$eventKey] = $eventVal.' - '.$eventFirstDateTime;
				}

			}

			$event1Field = new DropdownField( "Event1", "Event 1", $eventsArray);
			$event1Field->setEmptyString( '(No Event)' );
			$fields->addFieldToTab( 'Root.Main', $event1Field );

			$event2Field = new DropdownField( "Event2", "Event 2", $eventsArray);
			$event2Field->setEmptyString( '(No Event)' );
			$fields->addFieldToTab( 'Root.Main', $event2Field );

			$event3Field = new DropdownField( "Event3", "Event 3", $eventsArray);
			$event3Field->setEmptyString( '(No Event)' );
			$fields->addFieldToTab( 'Root.Main', $event3Field );

			$event4Field = new DropdownField( "Event4", "Event 4", $eventsArray);
			$event4Field->setEmptyString( '(No Event)' );
			$fields->addFieldToTab( 'Root.Main', $event4Field );

			$event5Field = new DropdownField( "Event5", "Event 6", $eventsArray);
			$event5Field->setEmptyString( '(No Event)' );
			$fields->addFieldToTab( 'Root.Main', $event5Field );

			$event5Field = new DropdownField( "Event6", "Event 7", $eventsArray);
			$event5Field->setEmptyString( '(No Event)' );
			$fields->addFieldToTab( 'Root.Main', $event5Field );

			$event6Field = new DropdownField( "Event7", "Event 8", $eventsArray);
			$event6Field->setEmptyString( '(No Event)' );
			$fields->addFieldToTab( 'Root.Main', $event6Field );

			$event7Field = new DropdownField( "Event8", "Event 8", $eventsArray);
			$event7Field->setEmptyString( '(No Event)' );
			$fields->addFieldToTab( 'Root.Main', $event7Field );


			$nfEvent1Field = new DropdownField( "NonFeaturedEvent1", "Nonfeatured Event 1", $eventsArray);
			$nfEvent1Field->setEmptyString( '(No Event)' );
			$fields->addFieldToTab( 'Root.Main', $nfEvent1Field );

			$nfEvent2Field = new DropdownField( "NonFeaturedEvent2", "Nonfeatured Event 2", $eventsArray);
			$nfEvent2Field->setEmptyString( '(No Event)' );
			$fields->addFieldToTab( 'Root.Main', $nfEvent2Field );

			$nfEvent3Field = new DropdownField( "NonFeaturedEvent3", "Nonfeatured Event 3", $eventsArray);
			$nfEvent3Field->setEmptyString( '(No Event)' );
			$fields->addFieldToTab( 'Root.Main', $nfEvent3Field );

			$nfEvent4Field = new DropdownField( "NonFeaturedEvent4", "Nonfeatured Event 4", $eventsArray);
			$nfEvent4Field->setEmptyString( '(No Event)' );
			$fields->addFieldToTab( 'Root.Main', $nfEvent4Field );

			$nfEvent5Field = new DropdownField( "NonFeaturedEvent5", "Nonfeatured Event 5", $eventsArray);
			$nfEvent5Field->setEmptyString( '(No Event)' );
			$fields->addFieldToTab( 'Root.Main', $nfEvent5Field );

			$nfEvent6Field = new DropdownField( "NonFeaturedEvent6", "Nonfeatured Event 6", $eventsArray);
			$nfEvent6Field->setEmptyString( '(No Event)' );
			$fields->addFieldToTab( 'Root.Main', $nfEvent6Field );

			$nfEvent7Field = new DropdownField( "NonFeaturedEvent7", "Nonfeatured Event 7", $eventsArray);
			$nfEvent7Field->setEmptyString( '(No Event)' );
			$fields->addFieldToTab( 'Root.Main', $nfEvent7Field );

			$nfEvent8Field = new DropdownField( "NonFeaturedEvent8", "Nonfeatured Event 8", $eventsArray);
			$nfEvent8Field->setEmptyString( '(No Event)' );
			$fields->addFieldToTab( 'Root.Main', $nfEvent8Field );

		}


		return $fields;
	}

	

}

