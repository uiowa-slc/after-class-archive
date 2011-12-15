<?php

class AfterClassEvent extends CalendarEvent {
	static $many_many = array (
		//"Tags" => "Tag",
		//"Categories" => "Category",
		"Sponsors" => "Sponsor",
		"Venues" => "Venue",
		"Eventtypes" => "Eventtype"
	);
	public static $db = array(
	'Title' => 'Text',
	'Location' => 'Text',
	'Cost' => 'Text',
	'Featured' => 'Boolean'
	);
	static $has_one = array(
		'Image' => 'SizedImage'
	);
	
	/*static $db = array (
		'Recursion' => 'Boolean',
		'CustomRecursionType' => 'Int',
		'DailyInterval' => 'Int',
		'WeeklyInterval' => 'Int',
		'MonthlyInterval' => 'Int',
		'MonthlyRecursionType1' => 'Int',
		'MonthlyRecursionType2' => 'Int',
		'MonthlyIndex' => 'Int',
		'MonthlyDayOfWeek' => 'Int'
	);*/
	
	public function getCMSFields() {
		$f = parent::getCMSFields();
		$f->removeFieldFromTab('Root.Content', 'Content'); // remove a field from a tab
		$f->addFieldToTab('Root.Content.Main',new TextField('Location','Location.') );
		$f->addFieldToTab('Root.Content.Main',new TextField('Cost','Cost of admission.') );
		$f->addFieldToTab('Root.Content.Main',new CheckboxField('Featured','Check if this is a featured event.'));
		$f->addFieldToTab('Root.Content.Main',new HTMLEditorField('Content','Content.') );
		$f->addFieldToTab('Root.Content.Main', new ImageField('Image'));
		
		/*$categoriesTablefield1 = new ManyManyComplexTableField(
        	$this,
        	'Categories',
        	'Category',
        	array(
       		'Title' => 'Title'
        	),
        	'getCMSFields_forPopup'
      	);
		$categoriesTablefield1->setAddTitle( 'Category' );
		$f->addFieldToTab( 'Root.Content.Categories', $categoriesTablefield1 );*/
		
		
		$categoriesTablefield2 = new ManyManyComplexTableField(
        	$this,
        	'Sponsors',
        	'Sponsor',
        	array(
       		'Title' => 'Title'
        	),
        	'getCMSFields_forPopup'
      	);
		$categoriesTablefield2->setAddTitle( 'Sponsor' );
		$f->addFieldToTab( 'Root.Content.Categories', $categoriesTablefield2 );
		
		$categoriesTablefield3 = new ManyManyComplexTableField(
        	$this,
        	'Venues',
        	'Venue',
        	array(
       		'Title' => 'Title'
        	),
        	'getCMSFields_forPopup'
      	);
		$categoriesTablefield3->setAddTitle( 'Venue' );
		$f->addFieldToTab( 'Root.Content.Categories', $categoriesTablefield3 );
		
		$categoriesTablefield4 = new ManyManyComplexTableField(
        	$this,
        	'Eventtypes',
        	'Eventtype',
        	array(
       		'Title' => 'Title'
        	),
        	'getCMSFields_forPopup'
      	);
		$categoriesTablefield4->setAddTitle( 'Event Type' );
		$f->addFieldToTab( 'Root.Content.Categories', $categoriesTablefield4 );
		
		return $f;
	}
}

class AfterClassEvent_Controller extends CalendarEvent_Controller {
	
}
class SizedImage extends Image {
	function generateSmallImage($gd) {
		$gd->SetQuality(90);
		return $gd->croppedResize(130,110);
	}
	function generateMediumImage($gd) {
		$gd->SetQuality(90);
		return $gd->croppedResize(340,290);
	}
	function generateLargeImage($gd) {
		$gd->SetQuality(90);
		return $gd->croppedResize(450,380);
	}
}