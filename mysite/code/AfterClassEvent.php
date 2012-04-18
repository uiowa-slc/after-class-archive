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
		'Submitterdate' => 'Text',
		'CancelReason' => 'Text',
		'status' => 'Text',
		'facebook_publishdate' => 'Date',
		'facebook_published' => 'Boolean'
	);
	static $has_one = array(
		'Image' => 'SizedImage'
	);
	
	static $defaults = array (
		"ParentID" => 6
	);
	
	//static $icon = self::getCMSIcon();
	
	static $default_parent = "events"; // URLSegment of default parent node.
	static $can_be_root = false;
	static $allowed_children = "none";
		
	function __construct($record = null, $isSingleton = false) { 
		parent::__construct($record, $isSingleton); 
	
		if((bool)$record['Featured']) { 
		
		
		
		Object::set_static('Page', 'icon', 'sapphire/javascript/tree/images/page'); } 
	}

	/*public static function getCMSIcon(){
		if($this->Featured) {
			$icon = array("sapphire/javascript/tree/images/page", "file");
			return $icon;
		}else{
			return Parent::$icon;
		
		}
	
	
	}*/
	
	function onBeforeWrite(){
		parent::onBeforeWrite();
		
		
		if($this->Featured){
			$this->ClassName = "FeaturedAfterClassEvent";
		}else {
			$this->ClassName = "AfterClassEvent";
		
		}
	
	
	}
	
	public function AllCategories(){
		//$categories = DataObject::get("Category", "")
		
		$categories = new DataObjectSet();
		$category_ids = array();
		
		$sponsors = $this->Sponsors();
		$category_ids = array_merge($category_ids, $sponsors->getIDList());
		
		$venues = $this->Venues();
		$category_ids = array_merge($category_ids, $venues->getIDList());
		
		$eventtypes = $this->Eventtypes();
		$category_ids = array_merge($category_ids, $eventtypes->getIDList());
		
		foreach($category_ids as $category_id){
			$category = DataObject::get_by_id("Category", $category_id);
			$categories->push($category);
		
		}
		return $categories;
	
	}
	
	public function RandomEventType(){
		$event_type = $this->getComponents('Eventtypes', '', 'RAND()', '', 1);
		
		if($event_type){
		
			return $event_type;
		}

	
	
	}
	
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
	
	public function onAfterPublish() {
		parent::onAfterPublish();
		if ((($this->Featured) && (!$this->facebook_publishdate)) && (!$this->facebook_published)) {
			//$this->facebook_publishdate = SS_Datetime::now(); #getdate(); # SS_Datetime::now() ? or SS_Datetime::now()->getValue();
			//$this->facebook_published = true;
			//$this->write();
			//$this->facebook_publish();
		}
		return true;
	}
	public function facebook_publish() {
 		//page = a.post("https://graph.facebook.com/#{self.password}/feed?access_token=#{self.token}&message=#{message}&link=#{url}&picture=#{picture}")
 		$url = 'https://graph.facebook.com/319621914746674/feed';
 		$message = $this->data()->Title;
 		foreach($this->data()->DateAndTime() as $time) {
 			$message = $message . ' - ';
 			$date = new DateTime($time->StartDate);
 			$message = $message . ' ' . $date->format('F d');
 			if ($time->EndDate) {
 				$date = new DateTime($time->EndDate);
 				$message = $message . ' to ' . $date->format('F d');
 			}
 		}
 		$fields = array(
 			'access_token' => urlencode("AAADc6v8HNekBAGxX0KBswrxm7itBjiC5xuNHpXEaxQJRxmKgYbxZC6luSf9pKD7m3n5MLpgfkeV92H1oTZAav1DUwAz3LD26vePiAQ5aouXt7OeuaZA"),
 			'message' => urlencode($message),
 			'link' => urlencode($this->data()->AbsoluteLink()),
 			'picture' => urlencode($this->data()->Image()->MediumImage()->AbsoluteURL)
        );
        $fields_string = "";
        foreach($fields as $key=>$value) { $fields_string .= $key.'='.$value.'&'; }
		rtrim($fields_string,'&');
 		$ch = curl_init();
 		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
 		curl_setopt($ch,CURLOPT_URL,$url);
		curl_setopt($ch,CURLOPT_POST,count($fields));
		curl_setopt($ch,CURLOPT_POSTFIELDS,$fields_string);
		//execute post
		$result = curl_exec($ch);
		//close connection
		curl_close($ch);
		return true;
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
	
	function getCMSActions() {
		$actions = parent::getCMSActions();
		//$Action = new FormAction(
		//	"doFacebook",
		//	"Post To Facebook"
        //);
		//$actions->push($Action);
		return $actions;
	}
	
	public function getCMSFields() {
		$f = parent::getCMSFields();
		
/* ------------------------------ */
/* Remove / Rename Default Fields */
/* ------------------------------ */

		$f->fieldByName('Root.Content.Main')->setTitle('Event Details');
		$f->fieldByName('Root.Content.Main.Title')->setTitle('Event Name');
		$f->removeFieldFromTab('Root.Content', 'MenuTitle'); // remove a field from a tab
		$f->removeFieldFromTab('Root.Content', 'Content'); // remove a field from a tab
		$f->removeFieldFromTab('Root.Content.Metadata', 'URL'); 
		$f->removeFieldFromTab('Root.Content', 'Metadata'); // remove a field from a tab	
		$f->removeFieldFromTab('Root.Content', 'GoogleSitemap'); // remove a field from a tab
		
		
		
/* ------------------------------------------------- */
/* Only show submitter information if it's available */
/* ------------------------------------------------- */

		if ($this->Submittername != "") {
			$f->addFieldToTab('Root.Content.SubmissionInfo',new TextField('Submittername','Name of submitter.') );
			$f->addFieldToTab('Root.Content.SubmissionInfo',new TextField('Submitteremail','Email of submitter.') );
			$f->addFieldToTab('Root.Content.SubmissionInfo',new TextField('Submitterdate','Suggested Dates.') );
		}
		
/* -------------------------------------------------------- */
/* Rewriting the URL Field Group to move it to the main tab */
/* -------------------------------------------------------- */
		
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
		
/* ----------------------------------- */
/* Add/Re-Add Content and Other Fields */
/* ----------------------------------- */
		
		$f->addFieldToTab("Root.Content.Main", $url_fieldgroup);
		$f->addFieldToTab('Root.Content.Main', new ImageField('Image','Event Image (450 x 380 pixels is preferred, also try to keep the file size under 1MB--optimally 100k)'));
		
		
		//$params = array('parent' => $this->ID, 'transaction' => "generic", 'imgstate' => 'existing'); //$this->Image->TransactionKey
		//$f->push(new PixlrEditorField('PixlrButton', _t('Pixlr.EDIT_IMAGE', 'Edit this image'), $this->Image, $params));
		
		
		$f->addFieldToTab('Root.Content.Main',new TextField('Location','Room Name or Number') );
		$f->addFieldToTab('Root.Content.Main',new TextField('Cost','Admission Cost (examples: "Free", "$5")') );
		$f->addFieldToTab('Root.Content.Main',new CheckboxField('Featured','Feature this event on the homepage and category pages'));
		$f->addFieldToTab('Root.Content.Main',new TextField('CancelReason','If this event is canceled/full, enter the reason here. Example: "Class is full!"') );
		$f->addFieldToTab('Root.Content.Main',new HTMLEditorField('Content','Event Description') );
		
		$date_instructions = '
		
		<h2>For Events Happening Just Once</h2>
		<p>Choose "Add a Date" and enter the Start Date, Start Time, and End Time (end time is optional).<em>The End Date should be blank</strong>.</em>

 
<h2>Events that Have Multiple "Ranges" (mostly CAB and Bijou Films)</h2>
<p>Sometimes a film will play for multiple ranges. They might play one day, skip a day or two, and then play for another range of time. Example: Inception could play on March 1, then March 3 and March 4. In this example, add a date and start time for March 1, then add another date range that starts with March 3, and ends with March 4 <strong>with no start/end times</strong>.</p>
<p>Another Example: Back to the Future might play on April 11, 12, 13, take a day off, then resume on 14, 15. We would just put this in two date ranges: April 11-13, and April 14-15 with NO start/end times.</p>

 

<h2>For Events that span several consecutive days with fairly similar start/end times</h2>

<p>Example: A poster sale or a book buyback</p>
<p>Chose "Add a Date" then enter the Start Date and the End Date for the event. Start Time and End Time must be blank. For these event types, you must describe the hours for the event in the Event Description.</p> ';
		
		
		
		
		$f->insertBefore(new LiteralField('DatesInstructions', $date_instructions), 'DateTimes');
		
		
		
		if($this->Submittername != '' ){
			$f->addFieldToTab('Root.Content.DatesandTimes', new LiteralField('SubmittedDates','<p>Suggested Date(s) from Submitter: <strong style="font-size: 18px">'.$this->Submitterdate.'</strong></p>'));
			$f->addFieldToTab('Root.Content.SubmissionInfo',new TextField('Submittername','Name of submitter.') );
			$f->addFieldToTab('Root.Content.SubmissionInfo',new TextField('Submitteremail','Email of submitter.') );
			$f->addFieldToTab('Root.Content.SubmissionInfo',new TextField('Submitterdate','Suggested Dates.') );
		}
		
/* ------------- */
/* Sponsor Table */
/* ------------- */
		$sponsorTablefield = new ManyManyComplexTableField(
        	$this,
        	'Sponsors',
        	'Sponsor',
        	array(
       		'Title' => 'Title'
        	),
        	'getCMSFields_forPopup',
        	null,
        	$sort = "Title ASC"
      	);
		$sponsorTablefield->setAddTitle( 'Sponsor' );
		$sponsorTablefield->showPagination = false;
		
		$f->addFieldToTab('Root.Content.Sponsors', new HeaderField("SponsorHeader","Sponsors"));

		$f->addFieldToTab( 'Root.Content.Sponsors', $sponsorTablefield );
		
/* ----------- */
/* Venue Table */
/* ----------- */

		$venueInstructions = '<h2>Instructions</h2><p>Every venue <em>must</em> have a somewhat complete address for Google Maps to work properly (example: Iowa Memorial Union, Iowa City, IA). Zip code is optional, but you NEED Iowa City, IA in each address. <br />The address field works as a search term on Google, and will give unexpected results with an incomplete address.</p>';
		
		
		$venueTablefield = new ManyManyComplexTableField(
        	$this,
        	'Venues',
        	'Venue',
        	array(
       		'Title' => 'Title'
        	),
        	'getCMSFields_forPopup',
        	null,
        	$sort = "Title ASC"
      	);
      	$f->addFieldToTab('Root.Content.VenueOrBuilding', new LiteralField('VenueInstructions', $venueInstructions));

		$f->addFieldToTab('Root.Content.VenueOrBuilding', new HeaderField("Venue Header","Venue(s) or building the event is in."));
		$venueTablefield->setAddTitle( 'Venue' );
		$venueTablefield->showPagination = false;

		$f->addFieldToTab( 'Root.Content.VenueOrBuilding', $venueTablefield );
		
/* ---------------- */		
/* Event Type Table */
/* ---------------- */	
	
		$eventTypeTablefield = new ManyManyComplexTableField(
        	$this,
        	'Eventtypes',
        	'Eventtype',
        	array(
       		'Title' => 'Title'
        	),
        	'getCMSFields_forPopup',
        	null,
        	$sort = 'Title ASC'
      	);
		$eventTypeTablefield->setAddTitle( 'Event Type' );
		$eventTypeTablefield->showPagination = false;

		$f->addFieldToTab('Root.Content.EventTypes', new HeaderField("EventTypeHeader","Event Type / Other Categories"));
		$f->addFieldToTab( 'Root.Content.EventTypes', $eventTypeTablefield);
		
		return $f;
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
 	static $allowed_actions = array ("fbpublish");
 	

 	
 	public function fbpublish() {
 		//page = a.post("https://graph.facebook.com/#{self.password}/feed?access_token=#{self.token}&message=#{message}&link=#{url}&picture=#{picture}")
 		$url = 'https://graph.facebook.com/319621914746674/feed';
 		$fields = array(
 			'access_token' => urlencode("AAADc6v8HNekBAGxX0KBswrxm7itBjiC5xuNHpXEaxQJRxmKgYbxZC6luSf9pKD7m3n5MLpgfkeV92H1oTZAav1DUwAz3LD26vePiAQ5aouXt7OeuaZA"),
 			'message' => urlencode($this->data()->Title),
 			'link' => urlencode("http://hulk.imu.uiowa.edu" . $this->data()->Link()),
 			'picture' => urlencode("http://hulk.imu.uiowa.edu" . $this->data()->Image()->MediumImage()->URL)
        );
        $fields_string = "";
        foreach($fields as $key=>$value) { $fields_string .= $key.'='.$value.'&'; }
		rtrim($fields_string,'&');
 		$ch = curl_init();
 		curl_setopt($ch,CURLOPT_URL,$url);
		curl_setopt($ch,CURLOPT_POST,count($fields));
		curl_setopt($ch,CURLOPT_POSTFIELDS,$fields_string);
		//execute post
		$result = curl_exec($ch);
		//close connection
		curl_close($ch);
 		$Data = array(
	      'Tokens' => $result
	    );
 		return $this->customise($Data)->renderWith(array('AfterClassCallback', 'Page'));
 	}


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
		return $gd->croppedResize(400,380);
	}
}