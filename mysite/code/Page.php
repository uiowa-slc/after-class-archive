<?php

use SilverStripe\View\SSViewer;
use SilverStripe\View\ArrayData;
use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\View\Requirements;
use SilverStripe\CMS\Controllers\ContentController;
class Page extends SiteTree {

	private static $db = array(

	);

	private static $has_one = array(

	);

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

}
