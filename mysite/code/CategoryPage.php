<?php
class CategoryPage extends Page {

	public static $db = array(
	);
	public static $has_one = array(
	);
	public function Category() {
		#return DataObject::get('Category',"Title = '$this->Title'");
		return DataObject::get_one('Category',"Title = 'CAB'");
	}
}
class CategoryPage_Controller extends Page_Controller {
	public static $allowed_actions = array (
	);
	public function getCategory() {
		if(is_numeric($Params['ID']) && $Category = DataObject::get_by_id('Category', (int)$Params['ID'])) {       
            return $Category;
        }
	}
	public function init() {
		parent::init();
		/*if($Category = $this->getCategory()) {
            $Data = array(
                'Category' => $Category
            );
            //return our $Data array to use on the page
            return $this->Customise($Data);
        } else {
            //Staff member not found
            return $this->httpError(404, 'Sorry that category could not be found.');
        }*/
	}
	/*function show() {
		if($Category = $this->getCategory()) {
            $Data = array(
                'Category' => $Category
            );
            //return our $Data array to use on the page
            return $this->Customise($Data);
        } else {
            //Staff member not found
            return $this->httpError(404, 'Sorry that category could not be found.');
        }
	}*/
}