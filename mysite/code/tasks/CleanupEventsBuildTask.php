<?php
class CleanupEventsBuildTask extends BuildTask {
 
    protected $title = 'Cleanup Events';
 
    protected $description = 'Move outdated events to the archive.';
 
    protected $enabled = true;
  function init() { 
      parent::init(); 
      // Unless called from the command line, all CliControllers need ADMIN privileges 
      if(!Director::is_cli() && !Permission::check("ADMIN")) { 
         return Security::permissionFailure(); 
      } 
   }
 function run($request) {
	$this->cleanupEvents();
    }
 
    function cleanupEvents() {
    
    	/* get our parent pages */
    	$archivePage = Page::get()->filter(array("URLSegment" => "archive"))->First();
    	$calendarPage = AfterClassCalendar::get()->First();

    	if($archivePage){
    		
    		echo "Archive page found, its ID is:".$archivePage->ID."<br />";
    		echo "Checking Events:<br />

    		<ul>";
    		$eventPages = AfterClassEvent::get()->filter(array("ParentID" => $calendarPage->ID));
    		
    		/* check all dates for each event */
    		foreach($eventPages as $eventPage){
    		
    			if($eventPage->UpcomingDatesAndRanges()->First()){
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