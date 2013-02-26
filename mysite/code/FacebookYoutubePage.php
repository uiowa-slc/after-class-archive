<?php
class FacebookYoutubePage extends Page {
	public static $db = array(
		'Video1' => 'Text',
		'Video1Text' => 'Text',
		'Video2' => 'Text',
		'Video2Text' => 'Text',
		'Video3' => 'Text',
		'Video3Text' => 'Text',
		'Video4' => 'Text',
		'Video4Text' => 'Text',
	);
	public static $has_one = array(
	);
	static $has_many = array(
		//'Events' => 'Event'
	);
	public function updatefeed() {
		//Get this page....
		//Upload HTML+Images to /pagelime/upload_content/$URLSegment/
		//Delete old images?
		//echo $URLSegment;
		//print "X:" . $BaseHref . $this->URLSegment . ":X\n";
		//print $this->AbsoluteLink();
		$this->download("http://gdata.youtube.com/feeds/api/users/imubuddy/uploads","imubuddy.html");
		$this->get_videos("imubuddy.html");
		//$this->get_images($this->URLSegment . ".html");
		//$this->replace_url($this->URLSegment . ".html");
		//$this->putfiles($this->URLSegment . ".html");
		return true;	
	}
	function download($file_source, $file_target) {
		//$file_target = "../tmp/download/" . $file_target;
        $rh = fopen($file_source, 'rb');
        if ($rh===false) {
			// error reading or opening file
			//echo "Couldn't read: " . $file_source . "<br>\n";
			return true;
        }
		$path = explode("/", $file_target);
		$x = array_slice($path,0,count($path) - 1);
		$path = implode("/",array_slice($path,0,count($path) - 1));
		if (empty($path)) { } else { mkdir($path . "/", 0755, true); }
		$wh = fopen($file_target, 'wb');
		if ($wh===false) {
			// error opening file
			echo "Couldn't write: " . $file_target . "<br>\n";
			return true;
        }
        while (!feof($rh)) {
            if (fwrite($wh, fread($rh, 1024)) === FALSE) {
                   // 'Download error: Cannot write to file ('.$file_target.')';
				   echo "Couldn't write to: " . $file_target;
                   return true;
               }
        }
        fclose($rh);
        fclose($wh);
        // No error
        return false;
    }
    
	function get_videos($file) {
		$filename = $file;
		$file = "../tmp/download/" . $file;
		$rh = fopen($file, 'rb');
		if ($rh===false) {
			// error reading or opening file
           return true;
        }
		$contents = fread($rh, filesize($file));
		fclose($rh);
		$array1 = preg_split("/videos\/[A-Za-z0-9_]+</",$contents);
		foreach ($array1 as &$value) {
		    //print_r($array1);
		    preg_match("/videos/[A-Za-z0-9_]+\//",$value,$match);
		    $video_id = $match[0]; #/videos/asdfjj/ ???
		    preg_match("<title *+>[A-Za-z0-9_]+</title>",$value,$match);
		    $title = $match[0]; # <title x>sdfsdf</title> ???
		    		    
			$array2 = explode("</id>",$value);
			$array2 = preg_split("/videos\/[A-Za-z0-9_]+</",$contents);
			$p1 = $array2[0];
			print_r($p1);
			print_r("\n\n");
			if (strpos($p1,"/") === false) {
				print_r($p1);
			}
		}
	}
	function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->removeFieldFromTab('Root.Content', 'Content'); // remove a field from a tab
		
		return $fields;
	}
	
}
class FacebookYoutubePage_Controller extends Page_Controller {
	public static $allowed_actions = array (
	);
	public function init() {
		parent::init();
	}
}