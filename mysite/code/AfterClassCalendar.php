<?php

class AfterClassCalendar extends Calendar {

 	static $db = array (
 		"Ad1URL" => "Text",
 		"Ad1Title" => "Text",
 		
 		"Ad2URL" => "Text",
 		"Ad2Title" => "Text",

 		"Ad3URL" => "Text",
 		"Ad3Title" => "Text",

 	);
 
 	static $has_one = array(
 		"Ad1Image" => "Image",
 		"Ad2Image" => "Image",
  		"Ad3Image" => "Image",
  		
  		"FeaturedEvent1" => "AfterClassEvent",
  		"FeaturedEvent2" => "AfterClassEvent",
  		"FeaturedEvent3" => "AfterClassEvent"
 	
 	);
	static $allowed_children = array (
	'AfterClassEvent'
	);
	
		function getCMSFields() {
		$fields =parent::getCMSFields();
		$fields->removeFieldFromTab("Root.Main", "Content");
		$fields->addFieldToTab("Root.Ads", new TextField("Ad1Title", "Ad 1 Title / Alt Text"));
		$fields->addFieldToTab("Root.Ads", new TextField("Ad1URL", "Ad 1 External Link"));
		$fields->addFieldToTab("Root.Ads", new UploadField("Ad1Image","Ad 1 Image (same dimensions as newsletter ad)"));
		
		$fields->addFieldToTab("Root.Ads", new TextField("Ad2Title", "Ad 2 Title / Alt Text"));
		$fields->addFieldToTab("Root.Ads", new TextField("Ad2URL", "Ad 2 External Link"));
		$fields->addFieldToTab("Root.Ads", new UploadField("Ad2Image", "Ad 2 Image (same dimensions as newsletter ad) "));
		
		$fields->addFieldToTab("Root.Ads", new TextField("Ad3Title", "Ad 3 Title / Alt Text"));
		$fields->addFieldToTab("Root.Ads", new TextField("Ad3URL", "Ad 3 External Link"));
		$fields->addFieldToTab("Root.Ads", new UploadField("Ad3Image", "Ad 3 Image (same dimensions as newsletter ad)"));

		$fields->addFieldToTab("Root.Main", new LiteralField("FeaturedEventLabel", "<h2>Feature these events on the homepage</h2> <p>If none of the events below have upcoming dates, they will not show up on the homepage.</p>"));
		
		$FeaturedEvent1Field = new TreeDropdownField( "FeaturedEvent1ID", "Featured Event 1", 'AfterClassEvent');
		$FeaturedEvent1Field->setTreeBaseId = 6;

		$fields->addFieldToTab("Root.Main", $FeaturedEvent1Field);

		$FeaturedEvent2Field = new TreeDropdownField( "FeaturedEvent2ID", "Featured Event 2", 'AfterClassEvent');
		$FeaturedEvent2Field->setTreeBaseId = 6;

		$fields->addFieldToTab("Root.Main", $FeaturedEvent2Field);

		$FeaturedEvent3Field = new TreeDropdownField( "FeaturedEvent3ID", "Featured Event 3", 'AfterClassEvent');
		$FeaturedEvent3Field->setTreeBaseId = 6;

		$fields->addFieldToTab("Root.Main", $FeaturedEvent3Field);	

		
		return $fields;
	}

	public function Eventtype() {
	    return Eventtype::get();
	}
	public function Sponsor() {
	    return Sponsor::get();
	}
	public function Venue() {
	    return Venue::get();
	}
	
	
	function FeaturedEvents() {
	
		$eventSet = new ArrayList();
		
		$events[] = $this->FeaturedEvent1();
		$events[] = $this->FeaturedEvent2();
		$events[] = $this->FeaturedEvent3();
		
		foreach($events as $event){
			$eventUpcomingDate = $event->UpcomingDatesAndRanges()->First();
			
			if(($eventUpcomingDate) && ($eventUpcomingDate->EventID != 0)){

				$eventSet->push($event);
			}
		}
				
		if($eventSet->exists()) {
			return $eventSet;
		}
		else{ 
			return false;	
		}
	
	}
	
}
 
class AfterClassCalendar_Controller extends Calendar_Controller {
	public function Home() {
		if($this->action == 'index'){
			return true;
		}else{
			return false;
		}
	}
 	 private static $url_handlers = array(
            'categories/$Category' => 'categories',
            'venues/$Venue' => 'venues',
            'sponsors/$Sponsor' => 'sponsors',
            'categories/$Category/rss' => 'categoriesrss',
            'feed/$Type' => 'Feed',
            'categories/$Category/feed/$Type' => 'Feed'
            );
 	private static $allowed_actions = array ("categories", "view", "category", "sponsor", "venue", "newrss", "categoriesrss", "venues", "sponsors", "Feed");
 	
 	
 	public function Feed(){

 		$feedType = addslashes($this->urlParams['Type']);

 		if(array_key_exists('Category', $this->urlParams)){
 			$categoryTitle = $this->urlParams['Category'];
 			$category = Category::get()->filter(array('Title' => $categoryTitle))->First();
 			$events = $category->Events();
 		}else{
 			$events = $this->AllEventsWithoutDuplicates();
 		}
 		
 		switch($feedType){
 			case "json":
 				return $this->getJsonFeed($events);
 				break;
 		}

 	}

 	public function getJsonFeed($events){
 		if(!isset($events)){
 			$events = $this->AllEventsWithoutDuplicates();
 		}
 		$data = array();

 		foreach($events as $eventNum => $event){

 			/* Get Dates in  an array for later */
 			$datesArray = array();
 			$dates = $event->DateTimes();
 			foreach($dates as $dateNum => $date){
 				$datesArray[$dateNum]["start_date"] = $date->StartDate;
 				$datesArray[$dateNum]["start_time"] = $date->StartTime;
 				$datesArray[$dateNum]["end_date"] = $date->EndDate;
 				$datesArray[$dateNum]["end_time"] = $date->EndTime;
 				$datesArray[$dateNum]["all_day"] = $date->AllDay;
 			}

 			$venuesArray = array();
 			$venues = $event->Venues();

 			foreach($venues as $venueNum => $venue){
 				$venuesArray[$venueNum]["name"] = $venue->AltTitle ? $venue->AltTitle : $venue->Title;
 				$venuesArray[$venueNum]["address"] = $venue->Address;
 				$venuesArray[$venueNum]["info"] = $venue->Info;
 				$venuesArray[$venueNum]["contact_email"] = $venue->Email;
 				$venuesArray[$venueNum]["contact_phone"] = $venue->Phone;
 				$venuesArray[$venueNum]["website_link"] = $venue->WebsiteURL;
 				$venuesArray[$venueNum]["latitude"] = $venue->Lat;
 				$venuesArray[$venueNum]["longitude"] = $venue->Lng;
 			}

 			$eventTypesArray = array();
 			$eventTypes = $event->eventTypes();

 			foreach($eventTypes as $eventTypeNum => $eventType){
 				$eventTypesArray[$eventTypeNum]["name"] = $eventType->Title;
 				$eventTypesArray[$eventTypeNum]["info"] = $eventType->Info;
 			}

  			$sponsorsArray = array();
 			$sponsors = $event->sponsors();

 			foreach($sponsors as $sponsorNum => $sponsor){
 				$sponsorsArray[$sponsorNum]["name"] = $sponsor->Title;
 				$sponsorsArray[$sponsorNum]["info"] = $sponsor->Info;
 				$sponsorsArray[$sponsorNum]["website_link"] = $sponsor->WebsiteURL;
 			}
 			
 			$data["events"][$eventNum]["id"] = $event->ID;
 			$data["events"][$eventNum]["name"] = $event->Title;
 			$data["events"][$eventNum]["link"] = $event->AbsoluteLink();
 			$data["events"][$eventNum]["more_info_link"] = $event->MoreInfoLink;
 			if($event->Image()){
 				$data["events"][$eventNum]["image"] = $event->Image()->CroppedImage(730, 462) ? $event->Image()->CroppedImage(730, 462)->getAbsoluteURL(): $event->Image()->getAbsoluteURL();
 				//$data["events"][$eventNum]["small_image"] = $event->Image()->SmallImage() ? $event->Image->SmallImage()->getAbsoluteURL(): null;
 			}
 			$data["events"][$eventNum]["cancel_note"] = $event->CancelReason;
 			$data["events"][$eventNum]["dates"] = $datesArray;
 			$data["events"][$eventNum]["price"] = $event->Cost;
 			$data["events"][$eventNum]["location"] = $event->Location;
 			$data["events"][$eventNum]["venues"] = $venuesArray;
 			$data["events"][$eventNum]["sponsors"] = $sponsorsArray;
 			$data["events"][$eventNum]["event_types"] = $eventTypesArray;



 			unset($datesArray);

 		}

 		echo json_encode($data);
 	}

 	# EventDate, EventLocation, EventCost
 	public function newrss() {
		$events = $this->data()->UpcomingEvents(null,$this->DefaultEventDisplay);
		foreach($events as $event) {
			$event->Title = strip_tags($event->_Dates()) . " : " . $event->EventTitle();
			$event->Description = strip_tags($event->EventContent());
		}
		
		//remove duplicates from the feed.
		
		$events->removeDuplicates("EventID");
		
		$rss_title = $this->RSSTitle ? $this->RSSTitle : sprintf(_t("Calendar.UPCOMINGEVENTSFOR","Upcoming Events for %s"),$this->Title);
		$rss = new RSSFeed($events, $this->Link(), $rss_title, "", "Title", "Description", "EventDate", "EventLocation");
		
		if(is_int($rss->lastModified)) {
			HTTP::register_modification_timestamp($rss->lastModified);
			header('Last-Modified: ' . gmdate("D, d M Y H:i:s", $rss->lastModified) . ' GMT');
		}
		if(!empty($rss->etag)) {
			HTTP::register_etag($rss->etag);
		}
		$xml = str_replace('&nbsp;', '&#160;', $rss->renderWith('RSSFeed'));
		$xml = preg_replace('/<!--(.|\s)*?-->/', '', $xml);
		$xml = trim($xml);
		HTTP::add_cache_headers();
		header("Content-type: text/xml");

 		$Data = array(
	      'Events' => $events
	    );
		
		echo trim(preg_replace('/<!--(.|\s)*?-->/', '', str_replace('&nbsp;', '&#160;', $this->customise($Data)->renderWith(array('AfterClassCategoryRss', 'Page')))));
		return "";
	}
	
 	
 	public function categoriesrss() {
		$events = $this->data()->UpcomingEvents(null,$this->DefaultEventDisplay);
		
		$events = new ArrayList();
		$CategoryName = addslashes($this->urlParams['Category']);
		if (strpos(strtolower($CategoryName),"-") === false) {
		  $Category = Category::get()->First();
		  $events = $Category->events();
		} else {
		  $Categories = explode("-",$CategoryName);
		  foreach ($Categories as $CatName) {
		  	$Category = Category::get()->First("Category", "URLSlug = '".$CatName."'"); 
		  	$CatEvents = $Category->events();
		  	$events->merge($CatEvents);
		  }
		  $e = $events->toArray();
		  CalendarUtil::date_sort($e);
		  $events = new ArrayList($e);
		}
		
		$events->removeDuplicates();

		foreach($events as $event) {
			$event->Title = strip_tags($event->EventTitle());
			$event->Description = strip_tags($event->EventContent());
		}
		$rss_title = $this->RSSTitle ? $this->RSSTitle : sprintf(_t("Calendar.UPCOMINGEVENTSFOR","Upcoming Events for %s"),$this->Title);
		$rss = new RSSFeed($events, $this->Link(), $rss_title, "", "Title", "Description", "EventDate", "EventLocation");
		
		if(is_int($rss->lastModified)) {
			HTTP::register_modification_timestamp($rss->lastModified);
			header('Last-Modified: ' . gmdate("D, d M Y H:i:s", $rss->lastModified) . ' GMT');
		}
		if(!empty($rss->etag)) {
			HTTP::register_etag($rss->etag);
		}
		$xml = str_replace('&nbsp;', '&#160;', $rss->renderWith('RSSFeed'));
		$xml = preg_replace('/<!--(.|\s)*?-->/', '', $xml);
		$xml = trim($xml);
		HTTP::add_cache_headers();
		header("Content-type: text/xml");
		//echo $xml;
		
 		$Data = array(
	      'Events' => $events
	    );
		
		echo trim(preg_replace('/<!--(.|\s)*?-->/', '', str_replace('&nbsp;', '&#160;', $this->customise($Data)->renderWith(array('AfterClassCategoryRss', 'Page')))));
		return "";
	}
	
	function AllEventsWithoutDuplicates() {

		$start_date = date( "d/m/Y", time() );
		$end_date = date('Y-m-d',strtotime(date("Y-m-d", time()) . " + 365 day"));
		$eventDateTimes = $this->getEventList(
			sfDate::getInstance()->date(),
			sfDate::getInstance()->addYear(10)->date(),
			null,
			null
		);
		$events = new ArrayList();

		foreach($eventDateTimes as $eventDateTime){
			$events->push($eventDateTime->Event());
		}
		$events->removeDuplicates('ID');
		return $events;
	}
	
	
 	/* Return a venue, or list of venues. */
 	function venues() {
 		$VenueName = addslashes($this->urlParams['Venue']);
 		if ($VenueName) {
 			$Venue = Venue::get()->First();
 			$Data = array(
	      		'Category' => $Venue,
	      		'CategoryName' => $VenueName
	    	);
 			return $this->customise($Data)->renderWith(array('AfterClassCategory', 'Calendar', 'Page'));
 		} else {
 			$Category = Venue::get();
 			$Data = array(
				'Category' => $Category
	    	);
 			return $this->customise($Data)->renderWith(array('AfterClassCategoryList', 'Page'));
 		}
 	}
 	/* Return a sponsor or list of sponsors. */
 	function sponsors() {
 		$SponsorName = addslashes($this->urlParams['Sponsor']);
 		if ($SponsorName) {
 			$Sponsor = Sponsor::get()->First();
 			$Data = array(
	      	'Category' => $Sponsor,
	      	'CategoryName' => $SponsorName
	    	);
 			return $this->customise($Data)->renderWith(array('AfterClassCategory', 'Calendar', 'Page'));
 		} else {
 			$Category = Sponsor::get();
 			$Data = array(
	    	  'Category' => $Category
	    	);
 			return $this->customise($Data)->renderWith(array('AfterClassCategoryList', 'Page'));
 		}
 	}
 	/* Return a category or list of eventtypes. */
 	function categories() {

 		$urlFilter = new URLSegmentFilter();
 		$CategoryName = addslashes($this->urlParams['Category']);

 		if ($CategoryName) {
 			$Category = Category::get()->filter(array('Title' => $CategoryName))->First();
 			if (!($Category)) {
 				$Category = Category::get();
 			}
 			$Data = array(
				'Category' => $Category,
				'CategoryName' => $CategoryName
	    	);
 			return $this->customise($Data)->renderWith(array('AfterClassCategory', 'Calendar', 'Page'));
 		} else {
 			$Category = Eventtype::get();
 			$Data = array(
	      	'Category' => $Category
	    	);
 			return $this->customise($Data)->renderWith(array('AfterClassCategoryList', 'Page'));
 		}
 	}

 	function sponsor() {
		Controller::curr()->redirect('./events/sponsors/');
 	}
 	function venue() {
 	   Controller::curr()->redirect('./events/venues/');
 	}
 	
 	public function dynamicNews(){
	 	$calendar = AfterClassCalendar::get()->First();

	 	$events = $calendar->AllEventsWithoutDuplicates();
	 	$count = $events->Count();
	 	$count = floor($count/3);
	 	$news = $this->RSSDisplay($count, 'http://afterclass.uiowa.edu/news/feed/');
	 	
	 	return $news;
	 	
 	}
 	
 	public function init() {
		RSSFeed::linkToFeed($this->Link() . "rss", "RSS Feed of this calendar");
		parent::init();
	}
 
 }