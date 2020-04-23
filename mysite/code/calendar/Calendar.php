<?php
use SilverStripe\ORM\DataList;
use SilverStripe\Lumberjack\Model\Lumberjack;
use SilverStripe\Forms\FieldList; 
use SilverStripe\Forms\GridField\GridFieldDataColumns;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\TagField\TagField;
use SilverStripe\ORM\ArrayList;
use SilverStripe\ORM\PaginatedList;
class Calendar extends Page {

	private static $db = array(
		'SubmissionInfo' => 'HTMLText',
		'SubmissionThanks' => 'HTMLText'
	);

	private static $many_many = array(
		'EmailRecipients' => 'CalendarEmailRecipient'
	);

	private static $defaults = array(
		'SubmissionThanks' => 'Thanks for submitting your post!'
	);

	private static $allowed_children = array (
		'CalendarEvent'
	);

	private static $icon_class = 'font-icon-calendar';

	private static $timezone = "America/Chicago";
	private static $language = "EN";

	public function EventDateTimesList($start = null, $end = null, $filter = null, $limit = null, $announcement_filter = null) {
		
		$list = new ArrayList();

		$children = $this->AllChildren();
		$ids = $children->column('ID');
		
		$relation = 'EventID';
		$eventClass = 'CalendarEvent';

		// if(!CalendarDateTime::get()->First()){
		// 	return $list;4
		// }

		$list = CalendarDateTime::get()
			->filter(array(
				$relation => $ids
			))
			->innerJoin($eventClass, "$relation = \"{$eventClass}\".\"ID\"")
			->innerJoin("SiteTree", "\"SiteTree\".\"ID\" = \"{$eventClass}\".\"ID\"")
			->where("Recursion != 1");
		if($start && $end) {
			$list = $list->where("
					(StartDate <= '$start' AND EndDate >= '$end') OR
					(StartDate BETWEEN '$start' AND '$end') OR
					(EndDate BETWEEN '$start' AND '$end')
					");
		}
		else if($start) {
			$list = $list->where("(StartDate >= '$start' OR EndDate > '$start')");
		}
		else if($end) {
			$list = $list->where("(EndDate <= '$end' OR StartDate < '$end')");
		}
		if($filter) {
			$list = $list->where($filter);
		}
		return $list;
	}

	public function EventList(){


		// $start_date = date( 'Y-m-d', time() );
		// $end_date = date('Y-m-d',strtotime(date("Y-m-d", time()) . " + 365 day"));

		// $eventDateTimes = $this->EventDateTimesList(
		// 	sfDate::getInstance()->date(),
		// 	sfDate::getInstance()->addYear(10)->date(),
		// 	null,
		// 	null
		// );

		// if(!$this->EventDateTimesList())
		// 	return null;

		$eventDateTimes = new ArrayList();
		$events = new ArrayList();


		$eventDateTimes = $this->EventDateTimesList();
		

		foreach($eventDateTimes as $eventDateTime){
			$events->push($eventDateTime->Event());
		}
		$curDate = date("Y-m-d");
		$eventsWithFutureExpiry = CalendarEvent::get()->filter(array('Expires:GreaterThan' => $curDate));
		


		//$eventsWithFutureExpiry = CalendarEvent::get();

		$events->merge($eventsWithFutureExpiry);
		$events->removeDuplicates('ID');
		// $paginatedList = new Arra($events, $this->getRequest());
		// $paginatedList->setPageLength(10);

		// return $paginatedList;

		return $events;
	}



	public function getCMSFields(){
		$fields = parent::getCMSFields();

		$fields->removeByName('LayoutType');
		$fields->removeByName('BackgroundImage');
		$fields->removeByName('Blocks');

		$fields->removeByName('MenuTitle');
		$fields->removeByName('MetaData');
		$fields->removeByName('Widgets');
		$fields->removeByName('SocialMediaSharing');

		$grid = $fields->dataFieldByName('ChildPages');
		$config = $grid->getConfig();
        $dataColumns = $config->getComponentByType(GridFieldDataColumns::class);

        $dataColumns->setDisplayFields([
            'Title' => 'Title',
            'Created' => 'Created'
        ]);

		$list = $grid->getList();

		$sortedList = $list->sort('Created DESC');

		$grid->setList($sortedList);
		$grid->setTitle('Events');
		$grid->setName('Events');
		
		$fields->addFieldToTab('Root.Main', $grid);

		$fields->removeByName("ChildPages");
		$fields->removeByName("Credit");

		$contentField = $fields->dataFieldByName('Content');
		$fields->remove($contentField);
		$fields->addFieldToTab('Root.Content', $contentField);

		$contentField->setRows(3);
		// $fields->removeByName("Content");

		$fields->addFieldToTab('Root.SubmissionsInfo', TagField::create(
			'EmailRecipients',
			'Notify these email addresses when events are submitted:',
			CalendarEmailRecipient::get(),
			$this->EmailRecipients(),
			'EmailAddress'
		)
		->setShouldLazyLoad(false) // tags should be lazy loaded
		->setCanCreate(true)->addExtraClass('stacked'));

		$fields->addFieldToTab('Root.SubmissionsInfo', HTMLEditorField::create('SubmissionInfo', 'Show this info on the submission page:')->addExtraClass('stacked')->setRows(10));
		$fields->addFieldToTab('Root.SubmissionsInfo', HTMLEditorField::create('SubmissionThanks', 'Show this upon a successful submission')->addExtraClass('stacked')->setRows(3));
		return $fields;
	}

	// public function getLumberjackPagesForGridfield($excluded = array()){
 //        return CalendarEvent::get()->filter([
 //            'ParentID' => $this->owner->ID,
 //            'ClassName' => $excluded,
 //        ])->sort('Created DESC');

	// }

}
