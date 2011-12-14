<?php

class AfterClassEvent extends CalendarEvent {
	static $many_many = array (
		//"Tags" => "Tag",
		"Categories" => "Category"
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
		
		$categoriesTablefield = new ManyManyComplexTableField(
        	$this,
        	'Categories',
        	'Category',
        	array(
       		'Title' => 'Title'
        	),
        	'getCMSFields_forPopup'
      	);
		$categoriesTablefield->setAddTitle( 'A Category' );
		$f->addFieldToTab( 'Root.Content.Categories', $categoriesTablefield );
		
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