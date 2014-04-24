<?php

class AfterClassEvent extends CalendarEvent {

	private static $db = array(
		'Title' =>'Text',
		'Location' => 'Text',
		'Cost' => 'Text',
		'Submittername' => 'Text',
		'Submitteremail' => 'Text',
		'Submitterdate' => 'Text',
		'CancelReason' => 'Text',
		'status' => 'Text',
		'facebook_publishdate' => 'Date',
		'facebook_published' => 'Boolean',
		'MoreInfoLink' => 'Text',
		'SubmitterSponsor' => 'Text'
		'FacebookEventLink' => 'Text'

	);
	private static $has_one = array(
		'Image' => 'SizedImage',
		"PrimarySponsor" => "Sponsor"
	);
	
	private static $defaults = array (
		"ParentID" => 6
	);

	private static $many_many = array (
		"Sponsors" => "Sponsor",
		"Venues" => "Venue",
		"Eventtypes" => "Eventtype"
	);
	
	private static $default_parent = "events"; // URLSegment of default parent node.
	private static $can_be_root = false;
	private static $allowed_children = "none";


    public function getStatusFlags($cached = true){
        $flags = parent::getStatusFlags();
        if($this->isUserSubmitted()){
        	$flags['isUserSubmitted'] = "Submitted";
    	}
    	if(!$this->UpcomingDatesAndRanges()->First()){
    		$flags['noUpcomingDatesAndRanges'] = "No Upcoming Dates";
    	}
    	if(($this->isUserSubmitted()) && ($this->DateTimes()->count() == 0)){
    		$flags['unscheduledUserSubmitted'] = "Unscheduled";
    	}
        return $flags;
    }
    
	public function isUserSubmitted(){
		if($this->Submittername != ""){
			return true;
		}else{
			return false;
		}
	}

	public function UpcomingDatesAndRanges($limit = 0)
	{
		return DataList::create($this->data()->getDateTimeClass())
			->filter("EventID", $this->ID)
			->where("\"StartDate\" >= DATE(NOW()) OR \"EndDate\" >= DATE(NOW())")
			->sort("\"StartDate\" ASC")
			->limit($limit);
	}

	/* Making this function available in the model by duplicating it from the controller. Crazy? MAYBE. */ 
	public function DateAndTime() {
		return DataList::create($this->getDateTimeClass())
			->filter("EventID", $this->ID)
			->sort("\"StartDate\" ASC");
	}

	public function AllCategories(){
		
		$categories = new ArrayList();
		$category_ids = array();
		
		$sponsors = $this->Sponsors();
		$category_ids = array_merge($category_ids, $sponsors->getIDList());
		
		$venues = $this->Venues();
		$category_ids = array_merge($category_ids, $venues->getIDList());
		
		$eventtypes = $this->Eventtypes();
		$category_ids = array_merge($category_ids, $eventtypes->getIDList());
		
		foreach($category_ids as $category_id){
			$category = Category::get()->byID($category_id);
			$categories->push($category);
		
		}
		return $categories;
	
	}
	
	
	function RelatedEvents() {
		$categories = $this->AllCategories();
		$events = new ArrayList();

		foreach($categories as $key => $category){
			$catEvent = $category->Events()->exclude(array('ID' => $this->ID))->sort('RAND()')->First();
			if($catEvent){
				if($catEvent->exists()){
					$events->push($catEvent);
				}
			}
		}

		$events->removeDuplicates();
		return $events;
	}

	function getCMSActions() {
		$actions = parent::getCMSActions();

		return $actions;
	}
	
	public function getCMSFields() {
		$f = parent::getCMSFields();
		
/* ------------------------------ */
/* Remove / Rename Default Fields */
/* ------------------------------ */

		$f->fieldByName('Root.Main')->setTitle('Event Details');
		$f->fieldByName('Root.Main.Title')->setTitle('Event Name');

/* ------------------------------------------------- */
/* Only show submitter information if it's available */
/* ------------------------------------------------- */

		if ($this->Submittername != "") {
			$f->addFieldToTab('Root.SubmissionInfo',new TextField('Submittername','Name of submitter.') );
			$f->addFieldToTab('Root.SubmissionInfo',new TextField('Submitteremail','Email of submitter.') );
			$f->addFieldToTab('Root.SubmissionInfo',new TextField('Submitterdate','Suggested Dates.') );
		}
/* ----------------------------------- */
/* Add/Re-Add Content and Other Fields */
/* ----------------------------------- */
		$f->addFieldToTab('Root.Main', new UploadField('Image','Event Image (<strong style="font-size: 14px">730x462 is preferred or 16:9 ratio</strong> pixels is preferred, also try to keep the file size under 1MB--optimally 100k)'));
		$f->addFieldToTab('Root.Main',new TextField('MoreInfoLink','A link for more information') );
		$f->addFieldToTab('Root.Main',new TextField('Location','Room Name or Number') );
		$f->addFieldToTab('Root.Main',new TextField('Cost','Admission Cost (examples: "Free", "$5")') );
		$f->addFieldToTab('Root.Main',new LiteralField('FeaturedRedirect','<p><a href="admin/pages/edit/show/6/" target="_blank">To feature this event, add it as one of the featured events under "Events" by going here &raquo;</a></p>') );
		$f->addFieldToTab('Root.Main',new TextField('CancelReason','If this event is canceled/full, enter the reason here. Example: "Class is full!"') );
		$f->addFieldtoTab( 'Root.Main', new TextField('SubmitterSponsor','Submitted Sponsor')); 
		$f->addFieldToTab('Root.Main',new TextField('FacebookEventLink', "Facebook Event Link"));
		$f->addFieldToTab('Root.Main',new HtmlEditorField('Content','Event Description') );
		$date_instructions = '
		<h2>For Events Happening Just Once</h2>
		<p>Choose "Add Calendar Date Time" and enter the Start Date, Start Time, and End Time (end time is optional).The End Date should be blank.</p>
		<h2>For Events that span several consecutive days or happen multiple days in a row</h2>
		<p><em>(Example: A poster sale or a CAB film)</em> Choose "Add Calendar Date Time" and enter each film showing/event as a separate date/time. Select the Start Date and Time for each event. A movie with 8 showings, will have 8 separate date/time listings.</p> ';
		
		$f->insertBefore(new LiteralField('DatesInstructions', $date_instructions), 'DateTimes');
		
		if($this->Submittername != '' ){
			$f->addFieldToTab('Root.DatesandTimes', new LiteralField('SubmittedDates','<p>Suggested Date(s) from Submitter: <strong style="font-size: 18px">'.$this->Submitterdate.'</strong></p>'));
			$f->addFieldToTab('Root.SubmissionInfo',new TextField('Submittername','Name of submitter.') );
			$f->addFieldToTab('Root.SubmissionInfo',new TextField('Submitteremail','Email of submitter.') );
			$f->addFieldToTab('Root.SubmissionInfo',new TextField('Submitterdate','Suggested Dates.') );
			
		}
/* ------------- */
/* Sponsor Table */
/* ------------- */

		$sponsorsMap = array();
		foreach(Sponsor::get() as $sponsor) {
			$sponsorsMap[$sponsor->ID] = $sponsor->Title;
		}
		asort($sponsorsMap);
		$sponsorsField = ListboxField::create('Sponsors', 'Sponsors <a href="admin/sponsors/" target="_blank">Add/Edit</a>')
			->setMultiple(true)
			->setSource($sponsorsMap)
			->setAttribute(
				'data-placeholder', 
				'Add Sponsors'
			);
		$f->addFieldToTab( 'Root.Main', $sponsorsField, "Content" );
		
/* ------------- */
/* Main Sponser Field */
/* ------------- */
		
		$mainSponsorField = new DropdownField('PrimarySponsorID','Primary Sponsor', Sponsor::get()->map());
		$mainSponsorField->setEmptyString('(No Primary Sponsor)');
		$f->addFieldToTab( 'Root.Main', $mainSponsorField, "Content");

/* ------------- */
/* Venue Table */
/* ------------- */

		$VenuesMap = array();
		foreach(Venue::get() as $Venue) {
			$VenuesMap[$Venue->ID] = $Venue->Title;
		}
		asort($VenuesMap);
		$VenuesField = ListboxField::create('Venues', 'Venues <a href="admin/venues/" target="_blank">Add/Edit</a>')
			->setMultiple(true)
			->setSource($VenuesMap)
			->setAttribute(
				'data-placeholder', 
				'Add Venues'
			);
		$f->addFieldToTab( 'Root.Main', $VenuesField, "Content" );
		
/* ------------- */
/* Event Type Table */
/* ------------- */

		$EventtypesMap = array();
		foreach(Eventtype::get() as $Eventtype) {
			$EventtypesMap[$Eventtype->ID] = $Eventtype->Title;
		}
		asort($EventtypesMap);
		$EventtypesField = ListboxField::create('Eventtypes', 'Eventtypes <a href="admin/eventtypes/" target="_blank">Add/Edit</a>')
			->setMultiple(true)
			->setSource($EventtypesMap)
			->setAttribute(
				'data-placeholder', 
				'Add Eventtypes'
			);
		$f->addFieldToTab( 'Root.Main', $EventtypesField, "Content" );
		return $f;
	}
	
	public function nearMeSummary () {
		$NoHTML = strip_tags($this->Content);
		$bad_guys = array("\"", "\n");
		$raw_fixed = str_replace($bad_guys, "&nbsp;", $NoHTML);
		$line = $raw_fixed;
		if (preg_match('/^.{1,200}\b/s', $raw_fixed, $match))
		{
			$line = $match[0];
		}
		return substr($line, 0);
	}
	
	
	 	 /* 
   * limits words to a number, but tries to validate the code 
   */ 
   public function getSummaryHTML ($limit = 100){ 
   	
      $m = 0; 
      $addEplisis = ''; 
      $returnstr = ''; 
      $returnArray = array(); 
      $html = array(); 
      $chars = preg_split('/(<[^>]*[^\/]>| )/i', $this->Content, -1, PREG_SPLIT_NO_EMPTY | PREG_SPLIT_DELIM_CAPTURE); 
      foreach ($chars as $elemnt) { 
         // found start tag 
         if(preg_match('/^<(p|h1|h2|h3|h4|h5|h6|q|b|i|strong|em)(.*)>$/', $elemnt)){ 
            preg_match('/^<(p|h1|h2|h3|h4|h5|h6|q|b|i|strong|em)(.*)>$/', $elemnt, $matches); 
            array_push($html, $matches[1]);// convert <p class=""> to p 
            array_push($returnArray, $elemnt); 
            // found end tag 
         } else if(preg_match('/^<\/(p|h1|h2|h3|h4|h5|h6|q|b|i|strong|em)(.*)>$/', $elemnt)){ 
            preg_match('/^<\/(p|h1|h2|h3|h4|h5|h6|q|b|i|strong|em)(.*)>$/', $elemnt, $matches); 
            $testelement = array_pop ($html); 
            // match (ie: <p>etc</p>) 
            if($testelement==$elemnt[1]) array_pop($html); 
            array_push($returnArray, $elemnt); 
         } else { 
            // done 
            if($elemnt == ' ') continue; 
            array_push($returnArray, $elemnt); 
            $m++; 
            if($m > $limit) { 
               $addEplisis = '&hellip;'; 
               break; 
            } 
         } 
      } 
      // convert start tags to end tags 
      $tmpr = ''; 
      foreach ($html as $elemnt) { 
         $tmpr.='</'.$elemnt.'>'; 
      } 
      return implode($returnArray, ' ') . $addEplisis . $tmpr; 
   }	
}

class AfterClassEvent_Controller extends CalendarEvent_Controller {

	public static $url_handlers = array(
		'fbpublish' => 'fbpublish'
	);

	public function AllCategories(){
		$categories = new ArrayList();
		$category_ids = array();
		$sponsors = $this->Sponsors();
		$category_ids = array_merge($category_ids, $sponsors->getIDList());
		$venues = $this->Venues();
		$category_ids = array_merge($category_ids, $venues->getIDList());
		$eventtypes = $this->EventTypes();
		$category_ids = array_merge($category_ids, $eventtypes->getIDList());
		foreach($category_ids as $category_id){
			$category = Category::get()->byID($category_id);
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
		return $gd->croppedResize(400,380);
	}
}