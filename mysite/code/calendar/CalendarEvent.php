<?php
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\GridField\GridFieldConfig_RelationEditor;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\LiteralField;
use SilverStripe\Forms\ReadonlyField;
class CalendarEvent extends Page {

	private static $db = array (
		'Location' => 'Text',
		'OnlineLocationUrl' => 'Text',



		'SocialLink' => 'Text',
		'SocialImageUrl' => 'Text',
		'SocialAuthorName' => 'Text',
		'SocialAuthorUrl' => 'Text',
		'SocialCaption' => 'HTMLText'
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




		$fields->addFieldToTab('Root.Main', new TextField('SocialLink'), 'Content');
		$fields->addFieldToTab('Root.Main', new ReadonlyField('SocialCaption'), 'Content');
		$fields->addFieldToTab('Root.Main', new TextField( 'Location', 'Event Location'), 'Content');
		$fields->addFieldToTab('Root.Main', new TextField( 'OnlineLocationUrl', 'Online Event Link'), 'Content');
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

					$this->SocialImageUrl = $jsonDecoded['thumbnail_url'];
					$this->SocialAuthorName = $jsonDecoded['author_name'];
					$this->SocialAuthorUrl = $jsonDecoded['author_url'];
					$this->SocialCaption = $jsonDecoded['title'];
				}

			break;

			case 'Twitter':
			//do other stuff
			break;

			default:
			// do nothing or throw error or something.
		}
        
        parent::onBeforeWrite();
    }
	private function parseFromSocial(){


	}


}
