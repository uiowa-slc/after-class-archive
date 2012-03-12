<?php
/**
 * Defines the HomePage page type
 */
class AfterClassNewsletter extends Page {
	static $db = array(
		'ImageLink' => 'Text'
	);
	static $has_one = array(
		'FeaturedEvent' => 'SiteTree',
		'Event1' => 'SiteTree',
		'Event2' => 'SiteTree',
		'Event3' => 'SiteTree',
		'Event4' => 'SiteTree',
		'Event5' => 'SiteTree',
		'Image' => 'Image'
	);
	static $has_many = array (
	);
	
	function getCMSFields() {
		$fields = parent::getCMSFields();
		
		$fields->addFieldToTab('Root.Content.Main', new ImageField('Image','Flickr or Youtube Image 200 x 150'));
		$fields->addFieldToTab('Root.Content.Main',new TextField('ImageLink','Flickr or Youtube link.') );
		$fields->addFieldToTab('Root.Content.Events', new TreeDropdownField("FeaturedEventID", "Featured event.", "SiteTree"));
		$fields->addFieldToTab('Root.Content.Events', new TreeDropdownField("Event1ID", "Event 1", "SiteTree"));
		$fields->addFieldToTab('Root.Content.Events', new TreeDropdownField("Event2ID", "Event 2", "SiteTree"));
		$fields->addFieldToTab('Root.Content.Events', new TreeDropdownField("Event3ID", "Event 3", "SiteTree"));
		$fields->addFieldToTab('Root.Content.Events', new TreeDropdownField("Event4ID", "Event 4", "SiteTree"));
		$fields->addFieldToTab('Root.Content.Events', new TreeDropdownField("Event5ID", "Event 5", "SiteTree"));
    	return $fields;
	}
	
}

class AfterClassNewsletter_Controller extends ContentController {
	function init() {
		parent::init();
	}
}
?>