<?php
class Page extends SiteTree {

	public static $db = array(
	);

	public static $has_one = array(
	
		"SecondaryContent" => "HTMLText"
	
	);
	public function getEventtypes() {
		return DataObject::get('Eventtype');
	}
	public function getVenues() {
		return DataObject::get('Venue','','Title ASC');
	}
	public function getSponsors() {
		return DataObject::get('Sponsor', '','Title ASC');
	}
	

		
    public static function NewsletterFormShortCodeHandler($arguments,$caption= null,$parser = null) {
    
		//get our template
		$template = new SSViewer('NewsletterForm');
		
		$customise = array();
		
		//return the customised template
		return $template->process(new ArrayData($customise));
	}
	
function allPagesToCache() {
    // Get each page type to define its sub-urls
    $urls = array();
    // memory intensive depending on number of pages
    $pages = DataObject::get("Page");
    $ignored = array('UserDefinedForm', 'AddEventPage');

    foreach($pages as $page) {
    	if(!in_array($page->ClassName, $ignored)) {
	    	$urls = array_merge($urls, (array)$page->subPagesToCache());
	    }
    }
    
    $urls[] = 'events/categories/';
    $urls[] = 'events/sponsors/';
    $urls[] = 'events/venues/';     
    // add any custom URLs which are not SiteTree instances
    //$urls[] = "sitemap.xml";
 
    return $urls;
  }
 
 /**
 
   * Get a list of URLs to cache related to this page
   */
  function subPagesToCache() {
    $urls = array();
 
    // add current page
    $urls[] = $this->Link();
     
    // cache the RSS feed if comments are enabled
    if ($this->ProvideComments) {
      $urls[] = Director::absoluteBaseURL() . "pagecomment/rss/" . $this->ID;
    }
     
    return $urls;
  }
   
  function pagesAffectedByChanges() {
    $urls = $this->subPagesToCache();
    if($p = $this->Parent) $urls = array_merge((array)$urls, (array)$p->subPagesToCache());
    
    $urls[] = 'events/categories/';
    $urls[] = 'events/sponsors/';
    $urls[] = 'events/venues/'; 
    
    return $urls;
  }

}
class Page_Controller extends ContentController {

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
	/*public static $allowed_actions = array (
	);*/

	public function init() {
		parent::init();
		// Note: you should use SS template require tags inside your templates 
		// instead of putting Requirements calls here.  However these are 
		// included so that our older themes still work
		//echo $_SERVER['HTTP_USER_AGENT'];
		  
		
	}
	
	
	
	public function AllDeadlines(){
	
		$deadlines = DataObject::get("Deadline", $filter=null, $sort = "Date ASC");
		
		if($deadlines){
			return $deadlines;
		
		}
	
	
	}
	
	public function FutureDeadlines($number = 0){
		$deadlines = DataObject::get("Deadline", $filter="Date >= DATE(NOW())", $sort = "Date ASC", $join = null, $limit = $number);
	
		if($deadlines){
			return $deadlines;
		
		}
			
	}
	
	public function RandomNewEvent($pool_size = 6) {
	
		$newest_events = DataObject::get("AfterClassEvent", $filter = null, $sort = "Created DESC", $join = null, $limit = $pool_size);
			if(isset($newest_events)){
			$events = $newest_events->toArray();
			shuffle($events);
			return $events[0];
		}
		
		
	
	
	}	
	
	public function iswindows() {
		if (strpos(strtolower($_SERVER['HTTP_USER_AGENT']),"windows") === false) {
		  return false;
		} else {
		  return true;
		}
	}
	
	function results($data, $form){
	        $data = array(
	            'Results' => $form->getResults(),
	            'Query' => $form->getSearchQuery(),
	            'Title' => 'Search Results'
	        );
	        $this->Query = $form->getSearchQuery();
	     
	        return $this->customise($data)->renderWith(array('Page_results', 'Page'));
	}
	function EditURL(){
		return "/admin/show/".$this->ID."/";
	}
	
	}