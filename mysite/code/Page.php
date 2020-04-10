<?php

use SilverStripe\View\SSViewer;
use SilverStripe\View\ArrayData;
use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\View\Requirements;
use SilverStripe\CMS\Controllers\ContentController;
use SilverStripe\Control\Controller;
use SilverStripe\StaticPublishQueue\Contract\StaticallyPublishable;
use SilverStripe\StaticPublishQueue\Contract\StaticPublishingTrigger;
use SilverStripe\Control\Director;

class Page extends SiteTree implements StaticallyPublishable {

	private static $db = array(

	);

	private static $has_one = array(

	);
	public function getCMSFields(){
		$fields = parent::getCMSFields();

		

		return $fields;

	}
    public static function NewsletterFormShortCodeHandler($arguments,$caption= null,$parser = null) {
		//get our template
		$template = new SSViewer('NewsletterForm');
		$customise = array();
		
		//return the customised template
		return $template->process(new ArrayData($customise));
	}

	public function StudentLifeNews($count = 5){

		$holder = StudentLifeNewsHolder::getOrCreate();

		return $holder->getBlogPostsFromFeed();

	}
	
	public function Calendar(){
  		return UiCalendar::get()->First();
  	}

 	public function CalendarWidget() {
		$calendar = CalendarWidget::create($this->Calendar());
		$controller = Controller::curr();
		if($controller->class == "UiCalendarController" || is_subclass_of($controller, "UiCalendarController")) {
			if($controller->getView() != "default") {
				if($startDate = $controller->getStartDate()) {
					$calendar->setOption('start', $startDate->format('Y-m-d'));
				}
				if($endDate = $controller->getEndDate()) {
					$calendar->setOption('end', $endDate->format('Y-m-d'));
				}
			}
		}
		return $calendar;
	}
	public function MonthJumpForm() {
		$controller = Controller::curr();
		if($controller->class == "Calendar_Controller" || is_subclass_of($controller, "Calendar_Controller")) {
			return Controller::curr()->MonthJumpForm();
		}
		$c = new Calendar_Controller($this);
		return $c->MonthJumpForm();
	}
    /**
     * The only URL belonging to this object is it's own URL.
     */
    public function urlsToCache()
    {
    
    	if($this->ClassName != 'SilverStripe\CMS\Model\RedirectorPage'){
    	
    		return [Director::absoluteURL($this->Link()) => 0];
    	}else{
    		return [];
    	}
        
    }
}
