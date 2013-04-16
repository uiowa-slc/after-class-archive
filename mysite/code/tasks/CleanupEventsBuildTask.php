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
    		
    			if($eventPage->UpcomingDates()){
    				$eventPage->archiveStatus = "still_new";
    			}else{
    				$eventPage->archiveStatus = "old";
    			}
    		
    			echo "<h3>Checking dates associated with <strong>".$eventPage->Title.": </strong></h3>";
    			/*
/*$eventDateTimes = $eventPage->Dates();
    			
    			if($eventDateTimes){
    			foreach($eventDateTimes as $eventDateTime){
    				$startDate = $eventDateTime->StartDate;
    				$endDate = $eventDateTime->EndDate;
    				 echo "<li>Starts:".$startDate.", ";
    				 
    				 /* if the start date is in the future, make sure the event status is new */
    				/*if($startDate){
    					if(strtotime($startDate) > time()){
    						$eventPage->archiveStatus = "still_new";
    					}
    				
    				}		*/ 
					/* if there's an end date on any range that's in the future, we know the event is always going to be new */
    				/*if($endDate){
    					echo "Ends:".$endDate;
    					if(strtotime($endDate) < time()){
    						echo "- <strong> old </strong>";
		
    					} else {
    						$eventPage->archiveStatus = "still_new";
    						echo "<strong>NEW DO NOT ARCHIVE</strong>";
    						
    					
    					}// end if end date is old
    					
    					
    					// need something here to check if still_new
    					
    				
    				}// end if endDate
    			
    			}// end foreach eventDateTimes

    			
    			if($eventPage->archiveStatus != 'still_new'){
    				$eventPage->archiveStatus = 'old';
    			
    			}
    			*/
    			echo "<br />status: ".$eventPage->archiveStatus;
    			
    			
    			if($eventPage->archiveStatus == 'old'){
    				//$eventPage->delete();
    				$eventPage->deleteFromStage("Live"); 
    				$eventPage->setParent($archivePage);
    				
    				
    				$eventPage->write();
    			
    			}	
    		
    	   } //end foreach events
    			echo "<br />done checking events!";

    	
    	}
    

	}//end function cleanupEvents
}// end CleanupEventsTask