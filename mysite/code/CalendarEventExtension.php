<?php
class CalendarEventExtension extends DataExtension {

	private static $db = array(
		'Location' => 'Text',
	);

	private static $has_one = array(
		"Image" => "Image"
	);

	private static $many_many = array (
		"Categories" => "Category"
	);

	public function updateCMSFields(FieldList $fields) {

		$categoriesMap = array();
		foreach(Category::get() as $category) {
			$categoriesMap[$category->ID] = $category->Title;
		}

		asort($categoriesMap);
		
		$tagField = ListboxField::create('Categories', 'Categories')
			->setMultiple(true)
			->setSource($categoriesMap)
			->setAttribute(
				'data-placeholder', 
				'Add Tags'
			);

		  $fields->addFieldToTab("Root.Main", new TextField("Location", "Location"));
		  $fields->addFieldToTab("Root.Main", new UploadField("Image", "Image"));
		  $fields->addFieldToTab("Root.Main", $tagField, "Content");

	}


}