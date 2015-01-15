<?php

class LocalistCalendarExtension extends DataExtension {

	private static $db = array(

		'FeaturedCategory1AltTitle' => 'Text',
		'FeaturedCategory1Id' => 'Int',

		'FeaturedCategory2AltTitle' => 'Text',
		'FeaturedCategory2Id' => 'Int',

		'FeaturedCategory3AltTitle' => 'Text',
		'FeaturedCategory3Id' => 'Int',

		'FeaturedCategory4AltTitle' => 'Text',
		'FeaturedCategory4Id' => 'Int',
	);

	public function updateCMSFields(FieldList $fields) {

		$types = $this->owner->TypeList();
		$typesArray = $types->map();

		$departments = $this->owner->DepartmentList();
		$departmentsArray = $departments->map();

		$venues = $this->owner->VenuesList();
		$venuesArray = $venues->map();

		$genInterests = $this->owner->GeneralInterestList();
		$genInterestsArray = $genInterests->map();

		$categoriesCombined = array_merge($typesArray, $departmentsArray, $venuesArray, $genInterestsArray);

		$featuredCategory1Dropdown = new DropdownField("FeaturedCategory1Id", "Featured Category 1", $categoriesCombined);
		$featuredCategory1Dropdown->setEmptyString('(No Category)');
		$fields->addFieldToTab('Root.FeaturedCategories', new TextField('FeaturedCategory1AltTitle', 'Featured Category 1 Title (optional)'));
		$fields->addFieldToTab('Root.FeaturedCategories', $featuredCategory1Dropdown);

		$featuredCategory2Dropdown = new DropdownField("FeaturedCategory2Id", "Featured Category 2", $categoriesCombined);
		$featuredCategory2Dropdown->setEmptyString('(No Category)');
		$fields->addFieldToTab('Root.FeaturedCategories', new TextField('FeaturedCategory2AltTitle', 'Featured Category 2 Title (optional)'));
		$fields->addFieldToTab('Root.FeaturedCategories', $featuredCategory2Dropdown);

		$featuredCategory3Dropdown = new DropdownField("FeaturedCategory3Id", "Featured Category 3", $categoriesCombined);
		$featuredCategory3Dropdown->setEmptyString('(No Category)');
		$fields->addFieldToTab('Root.FeaturedCategories', new TextField('FeaturedCategory3AltTitle', 'Featured Category 3 Title (optional)'));
		$fields->addFieldToTab('Root.FeaturedCategories', $featuredCategory3Dropdown);

		$featuredCategory4Dropdown = new DropdownField("FeaturedCategory4Id", "Featured Category 4", $categoriesCombined);
		$featuredCategory4Dropdown->setEmptyString('(No Category)');
		$fields->addFieldToTab('Root.FeaturedCategories', new TextField('FeaturedCategory4AltTitle', 'Featured Category 4 Title (optional)'));
		$fields->addFieldToTab('Root.FeaturedCategories', $featuredCategory4Dropdown);

	}

	public function FeaturedCategories() {

	}

}