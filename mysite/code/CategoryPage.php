<?php
class CategoryPage extends Page {

	public static $db = array(
	);
	public static $has_one = array(
	);
	public function Category() {
		#DataObject::get_by_id('Category', 1)
		return DataObject::get_one('Category',"Title = '$this->Title'");
	}
}
class CategoryPage_Controller extends Page_Controller {

	/**
	 * An array of actions that can be accessed via a request. Each array element should be an action name, and the
	 * permissions or conditions required to allow the user to access it.
	 *
	 * <code>
	 * array (
	 *     'action', // anyone can access this action
	 *     'action' => true, // same as above
	 *     'action' => 'ADMIN', // you must have ADMIN permissions to access this action
	 *     'action' => '->checkAction' // you can only access this action if $this->checkAction() returns true
	 * );
	 * </code>
	 *
	 * @var array
	 */
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