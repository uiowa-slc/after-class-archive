<?php
class UiCalendarNewsletter extends Page {

	private static $db = array(

		'FeaturedEventID' => 'Int',
		'FeaturedEventSummary' => 'HTMLText',

		'Category1Title' => 'Varchar(255)',
		'Category1Event1ID' => 'Int',
		'Category1Event2ID' => 'Int',

		'Category2Title' => 'Varchar(255)',
		'Category2Event1ID' => 'Int',
		'Category2Event2ID' => 'Int',

		'Category3Title' => 'Varchar(255)',
		'Category3Event1ID' => 'Int',
		'Category3Event2ID' => 'Int',

		'Category4Title' => 'Varchar(255)',
		'Category4Event1ID' => 'Int',
		'Category4Event2ID' => 'Int',

		'MoreEventsTitle' => 'Varchar(255)',
		'NonFeaturedRow1Event1ID' => 'Int',
		'NonFeaturedRow1Event2ID' => 'Int',
		'NonFeaturedRow2Event1ID' => 'Int',
		'NonFeaturedRow2Event2ID' => 'Int',
		'NonFeaturedRow3Event1ID' => 'Int',
		'NonFeaturedRow3Event2ID' => 'Int',
		'NonFeaturedRow4Event1ID' => 'Int',
		'NonFeaturedRow4Event2ID' => 'Int',
		'NonFeaturedRow5Event1ID' => 'Int',
		'NonFeaturedRow5Event2ID' => 'Int',

	);

	private static $has_one = array(

	);

	private static $defaults = array (
		'MoreEventsTitle' => 'More Events'
	);

	private static $icon = 'ac-json-events/images/calendar-file.png';

	public function getCMSFields() {
		$fields = parent::getCMSFields();
		$calendar = UiCalendar::getOrCreate();
		$fields->removeByName('Content');
		$fields->removeByName('Metadata');
		$events = $calendar->EventList();

		if ($events->First()) {
			$eventsArray = $events->map();

			//Featured Event:

			$featuredEventField = new DropdownField( "FeaturedEventID", "Featured Event", $eventsArray );
			$featuredEventField->setEmptyString( '(No Event)' );
			$fields->addFieldToTab( 'Root.Main', $featuredEventField );

			$fields->addFieldToTab('Root.Main', new HTMLEditorField('FeaturedEventSummary', 'Featured Event Content <strong>(required)</strong>'));
			$fields->addFieldToTab('Root.Main', new LabelField('CatLabel', 'Display up to eight events with photos, two per column:'));


			//Category 1:
			$fields->addFieldToTab('Root.Main', new TextField('Category1Title', 'Category 1 Title (Optional)'));

			$cat1event1Field = new DropdownField( "Category1Event1ID", "Event 1", $eventsArray );
			$cat1event1Field->setEmptyString( '(No Event)' );

			$cat1event2Field = new DropdownField( "Category1Event2ID", "Event 2", $eventsArray );
			$cat1event2Field->setEmptyString( '(No Event)' );

			$fields->addFieldToTab('Root.Main', $cat1event1Field);
			$fields->addFieldToTab('Root.Main', $cat1event2Field);

			//Category 2:
			$fields->addFieldToTab('Root.Main', new TextField('Category2Title', 'Category 2 Title (Optional)'));

			$cat2event1Field = new DropdownField( "Category2Event1ID", "Event 3", $eventsArray );
			$cat2event1Field->setEmptyString( '(No Event)' );

			$cat2event2Field = new DropdownField( "Category2Event2ID", "Event 4", $eventsArray );
			$cat2event2Field->setEmptyString( '(No Event)' );

			$fields->addFieldToTab('Root.Main', $cat2event1Field);
			$fields->addFieldToTab('Root.Main', $cat2event2Field);

			//Category 3:
			$fields->addFieldToTab('Root.Main', new TextField('Category3Title', 'Category 3 Title (Optional)'));

			$cat3event1Field = new DropdownField( "Category3Event1ID", "Event 5", $eventsArray );
			$cat3event1Field->setEmptyString( '(No Event)' );

			$cat3event2Field = new DropdownField( "Category3Event2ID", "Event 6", $eventsArray );
			$cat3event2Field->setEmptyString( '(No Event)' );

			$fields->addFieldToTab('Root.Main', $cat3event1Field);
			$fields->addFieldToTab('Root.Main', $cat3event2Field);

			//Category 4:
			$fields->addFieldToTab('Root.Main', new TextField('Category4Title', 'Category 4 Title (Optional)'));

			$cat4event1Field = new DropdownField( "Category4Event1ID", "Event 7", $eventsArray );
			$cat4event1Field->setEmptyString( '(No Event)' );

			$cat4event2Field = new DropdownField( "Category4Event2ID", "Event 8", $eventsArray );
			$cat4event2Field->setEmptyString( '(No Event)' );

			$fields->addFieldToTab('Root.Main', $cat4event1Field);
			$fields->addFieldToTab('Root.Main', $cat4event2Field);

			//More Events Section 
			$fields->addFieldToTab('Root.Main', new LabelField('MoreEventsLabel', 'Display up to ten events without photos:'));

			$fields->addFieldToTab('Root.Main', new TextField('MoreEventsTitle', 'More Events Title'));

			$nonFeaturedEvent1Field = new DropdownField( "NonFeaturedRow1Event1ID", "Non Featured Event 1", $eventsArray );
			$nonFeaturedEvent1Field->setEmptyString( '(No Event)' );
			$fields->addFieldToTab('Root.Main', $nonFeaturedEvent1Field);

			$nonFeaturedEvent2Field = new DropdownField( "NonFeaturedRow1Event2ID", "Non Featured Event 2", $eventsArray );
			$nonFeaturedEvent2Field->setEmptyString( '(No Event)' );
			$fields->addFieldToTab('Root.Main', $nonFeaturedEvent2Field);

			$nonFeaturedEvent3Field = new DropdownField( "NonFeaturedRow2Event1ID", "Non Featured Event 3", $eventsArray );
			$nonFeaturedEvent3Field->setEmptyString( '(No Event)' );
			$fields->addFieldToTab('Root.Main', $nonFeaturedEvent3Field);

			$nonFeaturedEvent4Field = new DropdownField( "NonFeaturedRow2Event2ID", "Non Featured Event 4", $eventsArray );
			$nonFeaturedEvent4Field->setEmptyString( '(No Event)' );
			$fields->addFieldToTab('Root.Main', $nonFeaturedEvent4Field);

			$nonFeaturedEvent5Field = new DropdownField( "NonFeaturedRow3Event1ID", "Non Featured Event 5", $eventsArray );
			$nonFeaturedEvent5Field->setEmptyString( '(No Event)' );
			$fields->addFieldToTab('Root.Main', $nonFeaturedEvent5Field);

			$nonFeaturedEvent6Field = new DropdownField( "NonFeaturedRow3Event2ID", "Non Featured Event 6", $eventsArray );
			$nonFeaturedEvent6Field->setEmptyString( '(No Event)' );
			$fields->addFieldToTab('Root.Main', $nonFeaturedEvent6Field);

			$nonFeaturedEvent7Field = new DropdownField( "NonFeaturedRow4Event1ID", "Non Featured Event 7", $eventsArray );
			$nonFeaturedEvent7Field->setEmptyString( '(No Event)' );
			$fields->addFieldToTab('Root.Main', $nonFeaturedEvent7Field);

			$nonFeaturedEvent8Field = new DropdownField( "NonFeaturedRow4Event2ID", "Non Featured Event 8", $eventsArray );
			$nonFeaturedEvent8Field->setEmptyString( '(No Event)' );
			$fields->addFieldToTab('Root.Main', $nonFeaturedEvent8Field);

			$nonFeaturedEvent9Field = new DropdownField( "NonFeaturedRow5Event1ID", "Non Featured Event 9", $eventsArray );
			$nonFeaturedEvent9Field->setEmptyString( '(No Event)' );
			$fields->addFieldToTab('Root.Main', $nonFeaturedEvent9Field);

			$nonFeaturedEvent10Field = new DropdownField( "NonFeaturedRow5Event2ID", "Non Featured Event 10", $eventsArray );
			$nonFeaturedEvent10Field->setEmptyString( '(No Event)' );
			$fields->addFieldToTab('Root.Main', $nonFeaturedEvent10Field);

		}


		return $fields;
	}

	

}

