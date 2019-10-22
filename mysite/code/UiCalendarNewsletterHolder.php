<?php
use SilverStripe\Lumberjack\Model\Lumberjack;
use SilverStripe\Forms\FieldList; 


class UiCalendarNewsletterHolder extends Page {

	private static $db = array(
	);
	private static $has_one = array(
	);
    private static $extensions = [
        Lumberjack::class,
    ];
	private static $allowed_children = array(
		'UiCalendarNewsletter'
	);

	public function getCMSFields(){
		$fields = parent::getCMSFields();
		$fields->addFieldToTab('Root.Main', $fields->dataFieldByName('ChildPages'));

		$fields->removeByName('Content');
		$fields->removeByName('Content');
		$fields->removeByName('LayoutType');
		$fields->removeByName('BackgroundImage');

		return $fields;
	}
}