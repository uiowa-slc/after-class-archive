<?php

class OrientationPersonModelAdmin extends ModelAdmin {


  private static $managed_models = array('OrientationPerson'); 
  private static $url_segment = 'orientation';
  private static $menu_title = 'Orientation Signups';
  private static $menu_icon = 'themes/afterclass2/images/CMSicons/sponsor.png';
  public $showImportForm = false; 
  
  
  public function getSearchContext() {
	  $context = parent::getSearchContext();
	  if($this->modelClass == 'OrientationPerson'){
		 /* $context->getFields()->push(new CheckboxField('q[AddedThisYear]', 'Only people added this year'));
		  $context->getFields()->push(new CheckboxField('q[AddedYesterday]', 'Only people added yesterday'));
		  $context->getFields()->push(new CheckboxField('q[AddedToday]', 'Only people added today'));
		  */
		  
		  $optionField = new OptionsetField(
			   $name = "dateFilter",
			   $title = "Select a Time Range",
			   $source = array(
		   		  "q[AddedToday]" => "Added Today",
			      "q[AddedYesterday]" => "Added Yesterday",
			      "q[AddedThisYear]" => "Added This Year",
			      "q[All]" => "All"
				),
			   $value = "q[All]"
			  );

		  $dateField = new DateField('DateCreated', 'Or a Specific Date (overrides above)');
		  $dateField->setConfig('showcalendar', true);

		   $context->getFields()->removeByName("q[Created]");
		   $context->getFields()->push($optionField);
		   $context->getFields()->push($dateField);
			
	  }
	  return $context; 
  }
  
  public function getList() {
	  	$list = parent::getList();
	  	$params = $this->request->requestVar('dateFilter');

	  	$created = $this->request->requestVar('DateCreated');
	  	$createdFormatted = date('Y-m-d', strtotime($created));

	  	$firstofTheYear = date('Y').'-01-01';
	  	$dayBefore = date('Y-m-d', strtotime("yesterday"));

	  	$addedToday = date('Y-m-d');

	  	if($this->modelClass == 'OrientationPerson' && isset($created) && $created) {
	  		$list = $list->filter(array('Created:PartialMatch' => $createdFormatted));
	  	}else{
		  	if($this->modelClass == 'OrientationPerson' && ($params == 'q[AddedThisYear]')) {
			  	$list = $list->filter(array('Created:GreaterThan' => $firstofTheYear));
		  	}
		  	if($this->modelClass == 'OrientationPerson' && ($params == 'q[AddedToday]')) {
			  	$list = $list->filter(array('Created:GreaterThanOrEqual' => $addedToday));
		  	}
		  	if($this->modelClass == 'OrientationPerson' && ($params == 'q[AddedYesterday]')) {
			  	$list = $list->filter(array('Created:PartialMatch' => $dayBefore));
		  	}
		}

	  	return $list;
  }


}

