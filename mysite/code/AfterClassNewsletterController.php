<?php
use SilverStripe\CMS\Controllers\ContentController;

class AfterClassNewsletterController extends ContentController {
	function init() {
		parent::init();
		$this->Content = str_replace('src="assets', 'src="'.Director::absoluteBaseURL().'/assets', $this->Content);
	}
}