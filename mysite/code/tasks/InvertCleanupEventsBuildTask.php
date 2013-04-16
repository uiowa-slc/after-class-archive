<?php
class InvertCleanupEventsBuildTask extends BuildTask {
 
    protected $title = 'Invert Cleanup Events';
 
    protected $description = 'Move current events out of the archive';
 
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
    	$eventsPage = DataObject::get_one("AfterClassCalendar");
    	$archivePage = DataObject::get_one("Page", "URLSegment = 'archive'");
    	
    	if($eventsPage){
    		
    		echo "Events page found, its ID is:".$eventsPage->ID."<br />";
    		echo "Checking archived Events:<br />
    		<ul>";
    		$eventPages = DataObject::get("AfterClassEvent", 'ParentID = '.$archivePage->ID);
    		
    		
    		/* check all dates for each event */
    		foreach($eventPages as $eventPage){
    		
    			if($eventPage->UpcomingDates()){
    				$eventPage->archiveStatus = "still_new";
    			}else{
    				$eventPage->archiveStatus = "old";
    			}
    		
    			echo "$eventPage->Title status: ".$eventPage->archiveStatus.'<br />';
    			
    			
    			if($eventPage->archiveStatus == 'still_new'){
    				//$eventPage->delete();
    				//$eventPage->deleteFromStage("Live"); 
    				
    				$eventPage->setParent($eventsPage);
    				
    				$eventPage->doPublish();
    				$eventPage->write();
    			
    			}	
    		
    	   } //end foreach events
    			echo "<br />done checking events!";

    	
    	}
    

	}//end function cleanupEvents
}// end CleanupEventsTask