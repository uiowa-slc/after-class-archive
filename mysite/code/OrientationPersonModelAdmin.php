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
		  $context->getFields()->push(new CheckboxField('q[AddedThisYear]', 'Only people added this year'));
	  }
	  return $context; 
  }
  
  public function getList() {
	  	$list = parent::getList();
	  	$params = $this->request->requestVar('q');
	  	$firstofTheYear = date('Y').'-01-01';
	  	if($this->modelClass == 'OrientationPerson' && isset($params['AddedThisYear']) && $params['AddedThisYear']) {
		  	$list = $list->filter(array('Created:GreaterThan' => $firstofTheYear));
	  	}
	  	return $list;
  }


}
