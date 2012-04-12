<?php
/**
 * Defines the HomePage page type
 */
class AfterClassNewsletter extends Page {
	static $db = array(
		'IntroText' => 'HTMLText',
		'ImageHeading' => 'Text',
		'ImageLink' => 'Text',
		'BlogTitle' => 'Text',
		'BlogIntro' => 'Text',
		'BlogLink' => 'Text',
		'BookstoreImageLink' => 'Text'
	);
	static $has_one = array(
		'FeaturedEvent' => 'SiteTree',
		'Event1' => 'SiteTree',
		'Event2' => 'SiteTree',
		'Event3' => 'SiteTree',
		'Event4' => 'SiteTree',
		'Event5' => 'SiteTree',
		'Image' => 'Image',
		'BookstoreImage' => 'Image'
	);
	static $has_many = array (
	);
	
	function getCMSFields() {
		$fields = parent::getCMSFields();
		
		//$fields->addFieldToTab('Root.Content.Main', new HTMLEditorField('IntroText'));
		$fields->addFieldToTab('Root.Content.Main', new ImageField('Image','Flickr or Youtube Image 250 x 187'));
		$fields->addFieldToTab('Root.Content.Main',new TextField('ImageHeading','Flickr or Youtube area heading (Example: recent photos).') );
		$fields->addFieldToTab('Root.Content.Main',new TextField('ImageLink','Flickr or Youtube link.') );
		$fields->addFieldToTab('Root.Content.Main',new TextField('BlogTitle','Blog Post Title') );
		$fields->addFieldToTab('Root.Content.Main',new TextField('BlogIntro','Blog Post Text.') );
		$fields->addFieldToTab('Root.Content.Main',new TextField('BlogLink','Link to the blog post.') );
		$fields->addFieldToTab('Root.Content.Ad', new ImageField('BookstoreImage','Bookstore ad Image 590 x 200'));
		$fields->addFieldToTab('Root.Content.Ad',new TextField('BookstoreImageLink','Bookstore ad link (with associatedid!!)') );
		
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