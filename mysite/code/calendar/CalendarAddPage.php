<?php
use SilverStripe\ORM\DataList;
use SilverStripe\Lumberjack\Model\Lumberjack;
use SilverStripe\Forms\FieldList; 
use SilverStripe\Forms\GridField\GridFieldDataColumns;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\TagField\TagField;
use SilverStripe\ORM\ArrayList;
use SilverStripe\ORM\PaginatedList;

class CalendarAddPage extends Page {

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

	private static $icon_class = 'font-icon-box';


	public function getCMSFields(){
		$fields = parent::getCMSFields();

		$fields->removeByName('LayoutType');
		$fields->removeByName('BackgroundImage');
		$fields->removeByName('Blocks');

		$fields->removeByName('MenuTitle');
		$fields->removeByName('MetaData');
		$fields->removeByName('Widgets');
		$fields->removeByName('SocialMediaSharing');


		$fields->addFieldToTab('Root.Main', TagField::create(
			'EmailRecipients',
			'Notify these email addresses when events are submitted:',
			CalendarEmailRecipient::get(),
			$this->EmailRecipients(),
			'EmailAddress'
		)
		->setShouldLazyLoad(false) // tags should be lazy loaded
		->setCanCreate(true)->addExtraClass('stacked'), 'Content');

		$fields->renameField('Content', 'Show this content below the submission form');

		$fields->addFieldToTab('Root.Main', HTMLEditorField::create('SubmissionInfo', 'Show this info on the submission form:')->addExtraClass('stacked')->setRows(10), 'Content');
		$fields->addFieldToTab('Root.Main', HTMLEditorField::create('SubmissionThanks', 'Show this upon a successful submission')->addExtraClass('stacked')->setRows(3), 'Content');
		return $fields;
	}

	public function getCalendar(){
		return Calendar::get()->First();
	}



}
