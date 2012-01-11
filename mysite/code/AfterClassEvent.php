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
		'Title' =>'Text',
		'Location' => 'Text',
		'Cost' => 'Text',
		'Featured' => 'Boolean'
	);
	static $has_one = array(
		'Image' => 'SizedImage'
	);
	
	function RelatedEvents() {
		$ids = array();
		
		// Get IDs of all events in these categories.
		foreach($this->Sponsors() as $category) {
		  $ids = array_merge($ids,$category->AfterClassEvents()->column('ID'));
		}
		foreach($this->Venues() as $category) {
		  $ids = array_merge($ids,$category->AfterClassEvents()->column('ID'));
		}
		foreach($this->Eventtypes() as $category) {
		  $ids = array_merge($ids,$category->AfterClassEvents()->column('ID'));
		}
		
		// Setup filter
		$filter = "`CalendarDateTime`.EventID IN (" . implode(',',$ids) . ")";
		// Get the calendar
		$calendar = DataObject::get_one("AfterClassCalendar");
		// Get the events from the calendar
		if (empty($ids)) {
			return false;
		} else {
			return $calendar->Events($filter,null,null,null,'4');
		}
	}
	
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
		
		$sponsorTablefield = new ManyManyComplexTableField(
        	$this,
        	'Sponsors',
        	'Sponsor',
        	array(
       		'Title' => 'Title'
        	),
        	'getCMSFields_forPopup'
      	);
		$sponsorTablefield->setAddTitle( 'Sponsor' );
				$f->addFieldToTab('Root.Content.Categories', new HeaderField("SponsorHeader","Sponsors"));

		$f->addFieldToTab( 'Root.Content.Categories', $sponsorTablefield );
		
		$venueTablefield = new ManyManyComplexTableField(
        	$this,
        	'Venues',
        	'Venue',
        	array(
       		'Title' => 'Title'
        	),
        	'getCMSFields_forPopup'
      	);
      	
		$f->addFieldToTab('Root.Content.Categories', new HeaderField("Venue Header","Venue(s)"));
		$venueTablefield->setAddTitle( 'Venue' );
		$f->addFieldToTab( 'Root.Content.Categories', $venueTablefield );
		
		$eventTypeTablefield = new ManyManyComplexTableField(
        	$this,
        	'Eventtypes',
        	'Eventtype',
        	array(
       		'Title' => 'Title'
        	),
        	'getCMSFields_forPopup'
      	);
		$eventTypeTablefield->setAddTitle( 'Event Type' );
		
		$f->addFieldToTab('Root.Content.Categories', new HeaderField("EventTypeHeader","Event Type / Other Categories"));
		$f->addFieldToTab( 'Root.Content.Categories', $eventTypeTablefield);
		
		return $f;
	}
}

class AfterClassEvent_Controller extends CalendarEvent_Controller {
	public function AllCategories(){
	//	$categories = DataObject::get("Category", "")
	
	
	}
	
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