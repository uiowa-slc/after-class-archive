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
			#($filter = null, $start_date = null, $end_date = null, $default_view = false, $limit = null, $announcement_filter = null)
			$events = $calendar->Events($filter,null,null,false,'4')->groupBy('EventID'); #Figure out how to GROUP BY `CalendarDateTime`.EventID
			$eventSet = new DataObjectSet();
			foreach($events as $event => $data) {
			    $eventSet->push($data->First()); //Get only the first of each event.
			}
			return $eventSet;
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
		$f->addFieldToTab('Root.Content.Main', new ImageField('Image','Main Image (450 x 380 pixels is preferred)'));
		$f->addFieldToTab('Root.Content.Main',new TextField('Location','Location') );
		$f->addFieldToTab('Root.Content.Main',new TextField('Cost','Cost of admission') );
		$f->addFieldToTab('Root.Content.Main',new CheckboxField('Featured','Is this a featured event?'));
		$f->addFieldToTab('Root.Content.Main',new HTMLEditorField('Content','Description') );
		
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
		$f->addFieldToTab( 'Root.Content.Tags', $categoriesTablefield1 );*/
		
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
				$f->addFieldToTab('Root.Content.Tags', new HeaderField("SponsorHeader","Sponsors"));

		$f->addFieldToTab( 'Root.Content.Tags', $sponsorTablefield );
		
		$venueTablefield = new ManyManyComplexTableField(
        	$this,
        	'Venues',
        	'Venue',
        	array(
       		'Title' => 'Title'
        	),
        	'getCMSFields_forPopup'
      	);
      	
		$f->addFieldToTab('Root.Content.Tags', new HeaderField("Venue Header","Venue(s)"));
		$venueTablefield->setAddTitle( 'Venue' );
		$f->addFieldToTab( 'Root.Content.Tags', $venueTablefield );
		
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
		
		$f->addFieldToTab('Root.Content.Tags', new HeaderField("EventTypeHeader","Event Type / Other Categories"));
		$f->addFieldToTab( 'Root.Content.Tags', $eventTypeTablefield);
		
		return $f;
	}
}

class AfterClassEvent_Controller extends CalendarEvent_Controller {
	public function AllCategories(){
	//	$categories = DataObject::get("Category", "")
	
	$categories = new DataObjectSet();
	$category_ids = array();
	
	$sponsors = $this->Sponsors();
	$category_ids = array_merge($category_ids, $sponsors->getIDList());
	
	$venues = $this->Venues();
	$category_ids = array_merge($category_ids, $venues->getIDList());
	
	$eventtypes = $this->EventTypes();
	$category_ids = array_merge($category_ids, $eventtypes->getIDList());
	
	foreach($category_ids as $category_id){
		$category = DataObject::get_by_id("Category", $category_id);
		$categories->push($category);
	
	}
	return $categories;
	
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