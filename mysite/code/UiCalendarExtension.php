<?php

use SilverStripe\Assets\Image;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\ORM\DataExtension;

	class UiCalendarExtension extends DataExtension {
		private static $db = array(
		

		);
		private static $has_one = array(
			

		);
		private static $belongs_many_many = array(
		
		);

		public function updateCMSFields(FieldList $fields){


			$fields->removeByName('BackgroundImage');
			$fields->removeByName('EventTypeFilterID');
			$fields->removeByName('DepartmentFilterID');
			$fields->removeByName('VenueFilterID');
			$fields->removeByName('GeneralInterestFilterID');
			$fields->removeByName('KeywordFilterID');
			$fields->removeByName('LayoutType');
			// $fields->removeByName('Content');
			$fields->removeByName('YoutubeBackgroundEmbed');

			return $fields;

	}

}