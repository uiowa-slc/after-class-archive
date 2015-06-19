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

	public function FeaturedTrendingCategories(){

		$trendingTypes = $this->owner->TrendingTypes();
		//print_r($trendingTypes->ID);
	    //get a random catagory
	    $trendingTypes = $trendingTypes->toArray();
	    $length = count($trendingTypes);
	  	$randomTrend = rand(0, $length - 1);
	  
	  	$trendTerm = $trendingTypes[$randomTrend];
	  	$trendTermID = $trendTerm->ID;

	
	    return $trendTerm;
		
			
			



	}

}