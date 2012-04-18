<?php
class FeaturedAfterClassEvent extends AfterClassEvent {

	public static $db = array(
	);
	public static $has_one = array(
	);
	
	
	public static $icon =  array("themes/afterclass2/images/featured-event", "file");
	
	
	

}
class FeaturedAfterClassEvent_Controller extends AfterClassEvent_Controller {
	public static $allowed_actions = array (
	);
	
	public function init() {
		parent::init();
	}

}