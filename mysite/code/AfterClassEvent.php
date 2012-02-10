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
		'Featured' => 'Boolean',
		'Submittername' => 'Text',
		'Submitteremail' => 'Text',
		'Submitterdate' => 'Text'
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
		/* Remove / Rename Default Fields */
		$f->fieldByName('Root.Content.Main')->setTitle('Event Details');
		$f->fieldByName('Root.Content.Main.Title')->setTitle('Event Name');
		
		$f->removeFieldFromTab('Root.Content', 'MenuTitle'); // remove a field from a tab
		$f->removeFieldFromTab('Root.Content', 'Content'); // remove a field from a tab
		$f->removeFieldFromTab('Root.Content.Metadata', 'URL'); 
		$f->removeFieldFromTab('Root.Content', 'Metadata'); // remove a field from a tab	
		$f->removeFieldFromTab('Root.Content', 'GoogleSitemap'); // remove a field from a tab	
		
		/* Rewriting the URL Field Group to move it to the main tab */
		
		$url_fieldgroup = new FieldGroup(_t('SiteTree.URL', "URL"),
							new LabelField('BaseUrlLabel',Controller::join_links (
								Director::absoluteBaseURL(),
								(self::nested_urls() && $this->ParentID ? $this->Parent()->RelativeLink(true) : null)
							)),
							new UniqueRestrictedTextField("URLSegment",
								"URLSegment",
								"SiteTree",
								_t('SiteTree.VALIDATIONURLSEGMENT1', "Another page is using that URL. URL must be unique for each page"),
								"[^A-Za-z0-9-]+",
								"-",
								_t('SiteTree.VALIDATIONURLSEGMENT2', "URLs can only be made up of letters, digits and hyphens."),
								"",
								"",
								"",
								50
							),
							new LabelField('TrailingSlashLabel',"/"));
		
		/* adding main fields */
		
		$f->addFieldToTab("Root.Content.Main", $url_fieldgroup);
		
		$f->addFieldToTab('Root.Content.Main', new ImageField('Image','Event Image (450 x 380 pixels is preferred, also try to keep the file size under 1MB--optimally 100k)'));
		$f->addFieldToTab('Root.Content.Main',new TextField('Location','Room Name or Number') );
		$f->addFieldToTab('Root.Content.Main',new TextField('Cost','Admission Cost (examples: "Free", "$5")') );
		$f->addFieldToTab('Root.Content.Main',new CheckboxField('Featured','Feature this event on the homepage and category pages'));
		$f->addFieldToTab('Root.Content.Main',new HTMLEditorField('Content','Event Description') );
		
		if($this->Submittername != '' ){
			$f->addFieldToTab('Root.Content.SubmissionInfo',new TextField('Submittername','Name of submitter.') );
			$f->addFieldToTab('Root.Content.SubmissionInfo',new TextField('Submitteremail','Email of submitter.') );
			$f->addFieldToTab('Root.Content.SubmissionInfo',new TextField('Submitterdate','Suggested Dates.') );
		}

		/* Sponsor Table */
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
		$sponsorTablefield->showPagination = false;
		
		$f->addFieldToTab('Root.Content.Sponsors', new HeaderField("SponsorHeader","Sponsors"));

		$f->addFieldToTab( 'Root.Content.Sponsors', $sponsorTablefield );
		
		/* Venue Table */
		
		$venueTablefield = new ManyManyComplexTableField(
        	$this,
        	'Venues',
        	'Venue',
        	array(
       		'Title' => 'Title'
        	),
        	'getCMSFields_forPopup'
      	);
      	
		$f->addFieldToTab('Root.Content.VenueOrBuilding', new HeaderField("Venue Header","Venue(s) or building the event is in."));
		$venueTablefield->setAddTitle( 'Venue' );
		$venueTablefield->showPagination = false;

		$f->addFieldToTab( 'Root.Content.VenueOrBuilding', $venueTablefield );
		
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
		$eventTypeTablefield->showPagination = false;

		$f->addFieldToTab('Root.Content.EventTypes', new HeaderField("EventTypeHeader","Event Type / Other Categories"));
		$f->addFieldToTab( 'Root.Content.EventTypes', $eventTypeTablefield);
		
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