<?php
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\GridField\GridFieldConfig_RelationEditor;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\DateField;
use SilverStripe\Forms\LiteralField;
use SilverStripe\Forms\ReadonlyField;
use SilverStripe\Forms\DropdownField;
use SilverStripe\View\SSViewer;
use SilverStripe\ORM\ArrayList;

class CalendarEvent extends Page {

	private static $db = array (
		'Location' => 'Text',
		'OnlineLocationUrl' => 'Text',

		'UiCalendarEventId' => 'Int',

		'SocialLink' => 'Text',
		'SocialImageUrl' => 'Text',
		'SocialAuthorName' => 'Text',
		'SocialAuthorUrl' => 'Text',
		'SocialCaption' => 'HTMLText',

		'Expires' => 'Date',


	);
	private static $icon_class = 'font-icon-p-event-alt';

	private static $has_many = array (
		'DateTimes' => 'CalendarDateTime'
	);

	private static $social_domains = array(
		'Facebook' => 'facebook.com',
		'Instagram' => 'instagram.com',
		'Twitter' => 'twitter.com'
	);

	public function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->removeByName('LayoutType');
		$fields->removeByName('BackgroundImage');
		$fields->removeByName('Blocks');
		$fields->removeByName('MenuTitle');
		$fields->removeByName('MetaData');
		$fields->removeByName('Widgets');
		$fields->removeByName('SocialMediaSharing');
		if($this->SocialImageUrl){
			$socialImagePrev =  '<p>Social image preview:</p>';
			$socialImagePrev .= '<div style="max-width: 300px; background: white; margin-bottom: 10px; padding: 10px; border: 1px solid #eee"><a style="display: block;" target="_blank" rel="noopener" href="'.$this->SocialLink.'"><img style="display: block; width:100%;" src="'.$this->SocialImageUrl.'" />@'.$this->SocialAuthorName.'</a></div>';
			$fields->addFieldToTab('Root.Main', new LiteralField('SocialImagePreview', $socialImagePrev), 'Content');

		}

		$events = UiCalendar::getOrCreate()->EventList();

		if ($events && $events->First()) {
			$eventsArray = $events->map()->toArray();

			foreach($eventsArray as $eventKey => $eventVal){

				
				$eventObj = $events->filter(array('ID' => $eventKey))->First();

				if($eventObj->Dates->First()){

					$eventFirstDateTime = $eventObj->Dates->First()->StartDateTime->Nice();
					$eventsArray[$eventKey] = $eventVal.' - '.$eventFirstDateTime;
				}

			}

			$featuredEvent1Field = new DropdownField("UiCalendarEventId", "Link this event to a Uiowa Calendar Event", $eventsArray);
			$featuredEvent1Field->setEmptyString('(No Event)');
			$fields->addFieldToTab('Root.Main', $featuredEvent1Field);

		}

		$fields->addFieldToTab('Root.Main', new TextField('SocialLink'), 'Content');
		$fields->addFieldToTab('Root.Main', new ReadonlyField('SocialCaption'), 'Content');
		$fields->addFieldToTab('Root.Main', new TextField( 'Location', 'Event Location'), 'Content');
		$fields->addFieldToTab('Root.Main', new TextField( 'OnlineLocationUrl', 'Online Event Link'), 'Content');
		

		$fields->addFieldToTab('Root.DatesAndTimes', DateField::create('Expires')->setHTML5(false)->setDateFormat('yyyy-MM-dd'), 'Expires on the following date:');
		$dateTimesConf = GridFieldConfig_RelationEditor::create();
		$dateTimesField = new GridField('DateTimes', 'Dates and Times', $this->DateTimes(), $dateTimesConf);

		$fields->addFieldToTab('Root.DatesAndTimes', $dateTimesField);



		return $fields;
	}

	public function getFirstStartDate(){
		$dateTime = $this->DateTimes()->sort('StartDate')->First();
		return $dateTime->StartDate;
	}
	public function getFirstEndDate(){
		$dateTime = $this->DateTimes()->sort('StartDate')->First();
		return $dateTime->EndDate;
	}

	public function SocialType(){

		if($this->SocialLink){
			$link = $this->SocialLink;
			$domains = $this->config()->get('social_domains');

			foreach($domains as $domainKey => $domainValue){
				if (strpos($link, $domainValue) !== false) {
					return $domainKey;
				}

			}

		}
	}
    public function onBeforeWrite() {

		$socialType = $this->SocialType();

		switch($socialType){

			//TODO: Standardize using oembed things:
			case 'Instagram':

				$json = SocialParseHelper::getJson('https://api.instagram.com/oembed?url='.$this->SocialLink);
				$jsonDecoded = json_decode($json, true);

				//TODO: Find a better more common way between platforms way to ensure array is sane.
				if(isset($jsonDecoded['author_url'])){
					$shortcode = $this->mediaid_to_shortcode($jsonDecoded['media_id']);
					$mediaUrl = 'https://api.instagram.com/p/'.$shortcode.'/media?size=l';

					// $this->SocialImageUrl = $jsonDecoded['thumbnail_url'];
					$this->SocialImageUrl = $mediaUrl;
					$this->SocialAuthorName = $jsonDecoded['author_name'];
					$this->SocialAuthorUrl = $jsonDecoded['author_url'];

					$this->SocialCaption = $jsonDecoded['title'];

					if(!$this->Title){
						$this->Title = "Post from ".$jsonDecoded['author_name'];
						$this->URLSegment = $jsonDecoded['author_name'].'-'.date('m-d-Y');
					}
				}

			break;

			case 'Twitter':
			//print_r('https://publish.twitter.com/ombed?url='.$this->SocialLink);
			$json = SocialParseHelper::getJson('https://publish.twitter.com/oembed?url='.$this->SocialLink);
			$jsonDecoded = json_decode($json, true);
			//print_r($jsonDecoded);
			if(isset($jsonDecoded['author_url'])){

					$this->SocialAuthorName = $jsonDecoded['author_name'];
					$this->SocialAuthorUrl = $jsonDecoded['author_url'];
					$this->SocialCaption = $jsonDecoded['html'];
			}


			break;

			default:
			// do nothing or throw error or something.
		}
        
        parent::onBeforeWrite();
    }
	private function parseFromSocial(){


	}

	public function parseMagicalDate($dateText){

        if (!$dateText) {
            return;
        }

        //$dates = strip_tags($dates);
        //Debug::show($dates);
        $datesArray = explode("\n", $dateText);

        $datesArrayList = new ArrayList();

        foreach ($datesArray as $date) {
            //$date = strip_tags($date);
            // strip whitespace
            $date = trim(preg_replace('/\s+/', ' ', $date));
            $date = str_replace( ',', '', $date );

            $dateParsedArray = date_parse($date);
            print_r($dateParsedArray);

            $datestamp = strtotime($date);


            print_r($datestamp);

            $dateFormatted = date('Y-m-d', $datestamp);

            $timeFormatted = date('g:iA', $datestamp);

            $dateObj = new CalendarDateTime();
            $dateObj->EventID = $this->ID;
            $dateObj->StartDate = $dateFormatted;
            $dateObj->StartTime = $timeFormatted;


            $datesArrayList->push($dateObj);

            $dateObj->write();



            //print_r($dateObj->DateFormatted);
        }

        return $datesArrayList;		
	}


    public function SocialCardHTML($size = 'full'){
    	$type = $this->SocialType();

    	if($type){
    		return $this->renderWith(array('Includes/SocialCard'.$type.'_'.$size, 'Includes/SocialCard'.$type));
    	}
    	
    	
    }


	private function mediaid_to_shortcode($mediaid){

	    if(strpos($mediaid, '_') !== false){
	        $pieces = explode('_', $mediaid);
	        $mediaid = $pieces[0];
	        $userid = $pieces[1];
	    }

	    $alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_';
	    $shortcode = '';
	    while($mediaid > 0){
	        $remainder = $mediaid % 64;
	        $mediaid = ($mediaid-$remainder) / 64;
	        $shortcode = $alphabet{$remainder} . $shortcode;
	    };

	    return $shortcode;

	}

}
