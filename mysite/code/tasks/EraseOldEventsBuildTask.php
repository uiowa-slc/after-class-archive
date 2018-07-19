<?php

use SilverStripe\Control\Director;
use SilverStripe\Security\Permission;
use SilverStripe\Security\Security;
use SilverStripe\Dev\BuildTask;
class EraseOldEventsBuildTask extends BuildTask {
 
    protected $title = 'Erase old events from the archive (DANGER)';
 
    protected $description = 'ONLY run this if you\'re Dustin or you know what you\'re doing.';
 
    protected $enabled = true;
  function init() { 
      parent::init(); 
      // Unless called from the command line, all CliControllers need ADMIN privileges 
      if(!Director::is_cli() && !Permission::check("ADMIN") && $_SERVER['REMOTE_ADDR'] != $_SERVER['SERVER_ADDR']) { 
         return Security::permissionFailure(); 
      } 
   }
 function run($request) {
	$this->cleanupEvents();
    }
 
    function cleanupEvents() {
    
        $archivePage = Page::get()->filter(array("URLSegment" => "archive"))->First();
    	
    	if($archivePage){
    		
    		echo "Archive page found, its ID is:".$archivePage->ID."<br />";
    		echo "Checking archived Events:<br />
    		<ul>";
    		$eventPages = AfterClassEvent::get()->filter(array("ParentID" => $archivePage->ID));
    		
    		
    		/* check all dates for each event */
    		foreach($eventPages as $eventPage){
    		
    			if($eventPage->UpcomingDatesAndRanges()->First()){
    				$eventPage->archiveStatus = "still_new";
    			}else{
    				$eventPage->archiveStatus = "old";
    			}
    		
    			echo "$eventPage->Title status: ".$eventPage->archiveStatus.'<br />';
    			
    			
    			if($eventPage->archiveStatus == 'old'){
                    $eventPage->deleteFromStage("Live");
    				$eventPage->deleteFromStage("Stage"); 
    			
    			}	
    		
    	   } //end foreach events
    			echo "<br />done checking and erasing events!";

    	
    	}
    

	}//end function cleanupEvents
}// end CleanupEventsTask