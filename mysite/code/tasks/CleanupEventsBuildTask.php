<?php
class CleanupEventsBuildTask extends BuildTask {
 
    protected $title = 'Cleanup Events';
 
    protected $description = 'Move outdated events to the archive.';
 
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
    
    	/* get our parent pages */
    	$archivePage = DataObject::get_one("Page", "URLSegment = 'archive'");
    	$calendarPage = DataObject::get_one("AfterClassCalendar");
    	
    	if($archivePage){
    		
    		echo "Archive page found, its ID is:".$archivePage->ID."<br />";
    		echo "Checking Events:<br />
    		<ul>";
    		$eventPages = DataObject::get("AfterClassEvent", 'ParentID = '.$calendarPage->ID);
    		
    		
    		/* check all dates for each event */
    		foreach($eventPages as $eventPage){
    		
    			if($eventPage->UpcomingDatesAndRanges()){
    				$eventPage->archiveStatus = "still_new";
    			}else{
	    			$eventPage->archiveStatus = "old";
    			}
    		
    			echo "<h3>Checking dates associated with <strong>".$eventPage->Title.": </strong></h3>";
    			echo "<br />status: ".$eventPage->archiveStatus;
    			
    			
    			if($eventPage->archiveStatus == 'old'){
    				$eventPage->doUnpublish(); 
    				$eventPage->setParent($archivePage);
    				$eventPage->write();
    			}	
    		
    	   } //end foreach events
    			echo "<br />done checking events!";

    	
    	}
    

	}//end function cleanupEvents
}// end CleanupEventsTask