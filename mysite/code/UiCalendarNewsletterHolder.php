<?php
use SilverStripe\Lumberjack\Model\Lumberjack;
use SilverStripe\Forms\FieldList; 
use SilverStripe\Forms\GridField\GridFieldDataColumns;

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

	private static $singular_name = 'Newsletter Holder';

	private static $plural_name = 'Newsletter Holders';

	public function getCMSFields(){
		$fields = parent::getCMSFields();

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
		
		$fields->addFieldToTab('Root.Main', $grid);

		$fields->removeByName('Content');
		$fields->removeByName('Content');
		$fields->removeByName('LayoutType');
		$fields->removeByName('BackgroundImage');

		return $fields;
	}

	public function getLumberjackPagesForGridfield($excluded = array()){
        return UiCalendarNewsletter::get()->filter([
            'ParentID' => $this->owner->ID,
            'ClassName' => $excluded,
        ])->sort('Created DESC');

	}
}