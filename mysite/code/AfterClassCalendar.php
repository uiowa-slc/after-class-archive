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
		/* $name, $title = "", $sourceClass = "SiteTree", $value = "", $labelField = "Title", $form = null, $emptyString = null, $parentID = 0, $cache = false */
		$fields->addFieldToTab('Root.Main', new SimpleTreeDropdownField($name = "FeaturedEvent1ID", $title = "Featured Event 1", $sourceClass = "SiteTree", $value = "", $labelField = "Title", $form = null, $emptyString = "None", $parentID = 6, $cache = false));
		$fields->addFieldToTab('Root.Main', new SimpleTreeDropdownField($name = "FeaturedEvent2ID", $title = "Featured Event 2", $sourceClass = "SiteTree", $value = "", $labelField = "Title", $form = null, $emptyString = "None", $parentID = 6, $cache = false));
		$fields->addFieldToTab('Root.Main', new SimpleTreeDropdownField($name = "FeaturedEvent3ID", $title = "Featured Event 3", $sourceClass = "SiteTree", $value = "", $labelField = "Title", $form = null, $emptyString = "None", $parentID = 6, $cache = false));
		/*$fields->addFieldToTab('Root.Main', new SimpleTreeDropdownField("FeaturedEvent1ID", "Featured Event 1", "SiteTree", null, null, null, null, 6));
		$fields->addFieldToTab('Root.Main', new SimpleTreeDropdownField("FeaturedEvent2ID", "Featured Event 2", "SiteTree"));
		$fields->addFieldToTab('Root.Main', new SimpleTreeDropdownField("FeaturedEvent3ID", "Featured Event 3", "SiteTree"));*/
		
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
			if($event->UpcomingDatesAndRanges()){
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
 	 public static $url_handlers = array(
            'categories/$Category' => 'categories',
            'venues/$Venue' => 'venues',
            'sponsors/$Sponsor' => 'sponsors',
            'categoriesrss/$Category' => 'categoriesrss',
            'categories/$Category/rss' => 'categoriesrss',

            );
 	static $allowed_actions = array ("categories", "view", "category", "sponsor", "venue", "newrss", "categoriesrss", "venues", "sponsors");
 	
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
		$calendar = $this->owner;
		$events = $calendar->getEventList('1900-01-01','3000-01-01');

		$eventsArray= $events->ToArray();

		$eventsArrayList = new ArrayList($eventsArray);
		$eventsArrayList->removeDuplicates('EventID');


		return $eventsArrayList;
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
 		$CategoryName = addslashes($this->urlParams['Category']);
 		if ($CategoryName) {
 			$Category = Category::get()->First();
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
	 	
	 	$events = $this->AllEventsWithoutDuplicates();
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