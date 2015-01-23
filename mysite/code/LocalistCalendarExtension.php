<?php

class LocalistCalendarExtension extends DataExtension {

	private static $db = array(

	);

	private static $has_many = array(
		'FeaturedCategories' => 'FeaturedCategory',
	);

	public function updateCMSFields(FieldList $fields) {
		$featuredCatGridFieldConfig = GridFieldConfig_RelationEditor::create();
		$featuredCatGridField = new GridField('FeaturedCategories', 'Featured Categories / Search Terms', $this->owner->FeaturedCategories(), $featuredCatGridFieldConfig);

		$fields->addFieldToTab('Root.Main', $featuredCatGridField);

	}

}