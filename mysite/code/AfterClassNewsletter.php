<?php

use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\Assets\Image;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\TreeDropdownField;
use SilverStripe\Control\Director;
use SilverStripe\CMS\Controllers\ContentController;
/**
 * Defines the HomePage page type
 */
class AfterClassNewsletter extends Page {
	private static $db = array(
		'IntroText' => 'HTMLText',
		'ImageHeading' => 'Text',
		'ImageLink' => 'Text',
		
		'BlogTitle' => 'Text',
		'BlogIntro' => 'Text',
		'BlogLink' => 'Text',
		
		'BlogTitle2' => 'Text',
		'BlogIntro2' => 'Text',
		'BlogLink2' => 'Text',
		
		'BlogTitle3' => 'Text',
		'BlogIntro3' => 'Text',
		'BlogLink3' => 'Text',
		
		'BlogTitle4' => 'Text',
		'BlogIntro4' => 'Text',
		'BlogLink4' => 'Text',
		
		'BlogTitle5' => 'Text',
		'BlogIntro5' => 'Text',
		'BlogLink5' => 'Text',
		
		'BlogTitle6' => 'Text',
		'BlogIntro6' => 'Text',
		'BlogLink6' => 'Text',

		'BlogTitle7' => 'Text',
		'BlogIntro7' => 'Text',
		'BlogLink7' => 'Text',		
		
		'BookstoreImageLink' => 'Text'
	);
	private static $has_one = array(
		'FeaturedEvent' => SiteTree::class,
		'Event1' => SiteTree::class,
		'Event2' => SiteTree::class,
		'Event3' => SiteTree::class,
		'Event4' => SiteTree::class,
		'Event5' => SiteTree::class,
		'Image' => Image::class,
		'BookstoreImage' => Image::class
	);
	private static $has_many = array (
	);
	
	public function getCMSFields() {
		$fields = parent::getCMSFields();
		

		$fields->addFieldToTab('Root.Main',new UploadField(Image::class,'Flickr or Youtube Image 250 x 187'));
		$fields->addFieldToTab('Root.Main',new TextField('ImageHeading','Flickr or Youtube area heading (Example: recent photos).') );
		$fields->addFieldToTab('Root.Main',new TextField('ImageLink','Flickr or Youtube link.') );
	/*	
		$fields->addFieldToTab('Root.BlogPost1',new TextField('BlogTitle','Blog Post Title') );
		$fields->addFieldToTab('Root.BlogPost1',new TextField('BlogIntro','Blog Post Text.') );
		$fields->addFieldToTab('Root.BlogPost1',new TextField('BlogLink','Link to the blog post.') );
		
		$fields->addFieldToTab('Root.BlogPost2',new TextField('BlogTitle2','Blog Post Title') );
		$fields->addFieldToTab('Root.BlogPost2',new TextField('BlogIntro2','Blog Post Text.') );
		$fields->addFieldToTab('Root.BlogPost2',new TextField('BlogLink2','Link to the blog post.') );
		
		$fields->addFieldToTab('Root.BlogPost3',new TextField('BlogTitle3','Blog Post Title') );
		$fields->addFieldToTab('Root.BlogPost3',new TextField('BlogIntro3','Blog Post Text.') );
		$fields->addFieldToTab('Root.BlogPost3',new TextField('BlogLink3','Link to the blog post.') );
		
		$fields->addFieldToTab('Root.BlogPost4',new TextField('BlogTitle4','Blog Post Title') );
		$fields->addFieldToTab('Root.BlogPost4',new TextField('BlogIntro4','Blog Post Text.') );
		$fields->addFieldToTab('Root.BlogPost4',new TextField('BlogLink4','Link to the blog post.') );
		
		$fields->addFieldToTab('Root.BlogPost5',new TextField('BlogTitle5','Blog Post Title') );
		$fields->addFieldToTab('Root.BlogPost5',new TextField('BlogIntro5','Blog Post Text.') );
		$fields->addFieldToTab('Root.BlogPost5',new TextField('BlogLink5','Link to the blog post.') );
		
		$fields->addFieldToTab('Root.BlogPost6',new TextField('BlogTitle6','Blog Post Title') );
		$fields->addFieldToTab('Root.BlogPost6',new TextField('BlogIntro6','Blog Post Text.') );
		$fields->addFieldToTab('Root.BlogPost6',new TextField('BlogLink6','Link to the blog post.') );

		$fields->addFieldToTab('Root.BlogPost7',new TextField('BlogTitle7','Blog Post Title') );
		$fields->addFieldToTab('Root.BlogPost7',new TextField('BlogIntro7','Blog Post Text.') );
		$fields->addFieldToTab('Root.BlogPost7',new TextField('BlogLink7','Link to the blog post.') );
	*/	
		$fields->addFieldToTab('Root.Ad', /*
### @@@@ UPGRADE REQUIRED @@@@ ###
FIND: new ImageField(
NOTE:  Check Syntax 
### @@@@ ########### @@@@ ###
*/new UploadField('BookstoreImage','Bookstore ad Image 590 x 200'));
		$fields->addFieldToTab('Root.Ad',new TextField('BookstoreImageLink','Bookstore ad link (with associatedid!!)') );
		
		$fields->addFieldToTab('Root.Events', new TreeDropdownField("FeaturedEventID", "Featured event.", SiteTree::class));
		$fields->addFieldToTab('Root.Events', new TreeDropdownField("Event1ID", "Event 1", SiteTree::class));
		$fields->addFieldToTab('Root.Events', new TreeDropdownField("Event2ID", "Event 2", SiteTree::class));
		$fields->addFieldToTab('Root.Events', new TreeDropdownField("Event3ID", "Event 3", SiteTree::class));
		$fields->addFieldToTab('Root.Events', new TreeDropdownField("Event4ID", "Event 4", SiteTree::class));
		$fields->addFieldToTab('Root.Events', new TreeDropdownField("Event5ID", "Event 5", SiteTree::class));
    	return $fields;
	}
	
}


?>