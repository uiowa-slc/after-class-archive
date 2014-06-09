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
		  
		  $optionField = 
		  	   new OptionsetField(
			   $name = "dateFilter",
			   $title = "Select Time Range",
			   $source = array(
			   		  "q[AddedToday]" => "Added Today",
				      "q[AddedYesterday]" => "Added Yesterday",
				      "q[AddedThisYear]" => "Added This Year",
				      "q[All]" => "All"
					  ),
			   $value = "q[All]"
			  );
		   
		   
		   $context->getFields()->push($optionField);
			
	  }
	  return $context; 
  }
  
  public function getList() {
	  	$list = parent::getList();
	  	$params = $this->request->requestVar('dateFilter');
	  	$firstofTheYear = date('Y').'-01-01';
	  	$dayBefore = date('Y-m-d', strtotime("yesterday"));
	  	//Debug::show($dayBefore);
	  	$addedToday = date('Y-m-d');
	  	if($this->modelClass == 'OrientationPerson' && ($params == 'q[AddedThisYear]')) {
		  	$list = $list->filter(array('Created:GreaterThan' => $firstofTheYear));
	  	}
	  	if($this->modelClass == 'OrientationPerson' && ($params == 'q[AddedToday]')) {
		  	$list = $list->filter(array('Created:GreaterThanOrEqual' => $addedToday));
	  	}
	  	if($this->modelClass == 'OrientationPerson' && ($params == 'q[AddedYesterday]')) {
		  	$list = $list->filter(array('Created:PartialMatch' => $dayBefore));
	  	}
	  	return $list;
  }


}

