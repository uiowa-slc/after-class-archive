<?php
class MakeRSSFeedTask extends BuildTask {
 
    protected $title = 'Generate RSS Feed';
 
    protected $description = 'Make an XML/RSS Feed of Page Titles and Content';
 
    protected $enabled = true;
 
 function run($request) {
	$this->makeRSS();
    }
 
    function makeRSS() {
    
    	$pages = /*
### @@@@ UPGRADE REQUIRED @@@@ ###
FIND: DataObject::get(
NOTE:  - replace with ClassName::get(  
### @@@@ ########### @@@@ ###
*/DataObject::get("Page");
    	
    	echo '<?xml version="1.0" encoding="ISO-8859-1" ?>
<rss version="2.0">

<channel>
  <title>Dance Department Website</title>
  <link>http://dance.uiowa.edu</link>
  <description>All Page Titles and Content Fields</description>
  ';
  
  	foreach($pages as $page){
  	
  		echo "<item>
    <title>".$page->Title()."</title>
    <link>".$page->AbsoluteLink."</link>
    <description>".$page->Content()."</description>
  </item>";

  	
  	}
  
  echo "

</channel>

</rss>";
    	
        

	}//end function makeRSS
}// end CleanupEventsTask