<?php
use SilverStripe\ORM\DataObject;
use SilverStripe\Control\HTTPResponse;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\LabelField;
use SilverStripe\Forms\LiteralField;
use SilverStripe\Forms\DateField;
use SilverStripe\Forms\EmailField;
use SilverStripe\Forms\TextareaField;
use SilverStripe\Forms\FormAction;
use SilverStripe\Forms\Form;
use SilverStripe\Control\Email\Email;
use SilverStripe\View\ArrayData;
use SilverStripe\Security\Security;
use SilverStripe\ORM\ArrayList;
use SilverStripe\View\Parsers\URLSegmentFilter;
use SilverStripe\Security\Permission;
use SilverStripe\Core\Injector\Injector;
use Psr\Log\LoggerInterface;
use SilverStripe\Control\Director;

class CalendarController extends PageController{

	private static $allowed_actions = array(
		// 'year'
		'ics',
	);

	private static $url_handlers = array(

	);

	// public function year(){
	// 	$params = $this->getRequest()->params();
	// 	$year = $params['Year'];

	// 	if($year){
	// 		echo 'year set';

	// 	}

	// 	//$endDate = sfDate::getInstance($d->finalDayOfYear()->date());


	// }


	public function add(){
		return $this->renderWith(array('Calendar_add', 'Page'));

	}

	public function ics() {
		//echo 'hello';
		$params = $this->getRequest()->params();

	// 	$year = $params['Year'];
		$feed = false;
		$announcement = false;
		$id = $params['ID'];
		$oid = $params['OtherID'];
		if(stristr($id, "ICS_") !== false) {
			$id = str_replace("ICS_","",$id);
			$feed = true;
		}
		if(is_numeric($id) && $oid) {
			if(!$feed) {
				$event = DataObject::get_by_id('CalendarEvent', $id);

                // return if not found
                if (!$event) {
                	echo 'event not found?';
                    //return $this->httpError(404);
                }
				$FILENAME = $announcement ? preg_replace("/[^a-zA-Z0-9s]/", "", $event->Title) : $event->URLSegment;
			}
			else {
				$FILENAME = preg_replace("/[^a-zA-Z0-9s]/", "", urldecode($_REQUEST['title']));
			}


			$FILENAME .= ".ics";
			$HOST = $_SERVER['HTTP_HOST'];
			$TIMEZONE = Calendar::config()->timezone;
			$LANGUAGE = Calendar::config()->language;
			$CALSCALE = "GREGORIAN";
			$parts = explode('-',$oid);
			$START_TIMESTAMP = $parts[0];
			$END_TIMESTAMP = $parts[1];
			if(!$feed) {
				$URL = $announcement ? $event->Calendar()->AbsoluteLink() : $event->AbsoluteLink();
			}
			else {
				$URL = "";
			}
			$TITLE = $feed ? $_REQUEST['title'] : $event->Title;
			$CONTENT = $feed ? $_REQUEST['content'] : $event->obj('Content')->Summary();
			$LOCATION = $feed ? $_REQUEST['location'] : $event->Location;

			// $this->setResponse(new HTTPResponse());
			$this->getResponse()->addHeader('Cache-Control','private');
			$this->getResponse()->addHeader('Content-Description','File Transfer');
			$this->getResponse()->addHeader('Content-Type','text/calendar');
			$this->getResponse()->addHeader('Content-Transfer-Encoding','binary');
			if(stristr($_SERVER['HTTP_USER_AGENT'], "MSIE")) {
 				$this->getResponse()->addHeader("Content-disposition","filename=".$FILENAME."; attachment;");
 			}
 			else {
 				$this->getResponse()->addHeader("Content-disposition","attachment; filename=".$FILENAME);
 			}
			$result = trim(strip_tags($this->customise(array(
				'HOST' => $HOST,
				'LANGUAGE' => $LANGUAGE,
				'TIMEZONE' => $TIMEZONE,
				'CALSCALE' => $CALSCALE,
				'START_TIMESTAMP' => $START_TIMESTAMP,
				'END_TIMESTAMP' => $END_TIMESTAMP,
				'URL' => $URL,
				'TITLE' => $TITLE,
				'CONTENT' => $CONTENT,
				'LOCATION' => $LOCATION
			))->renderWith(array('ics'))));

			$this->getResponse()->setBody($result);
			//print_r($this->getResponse());
			return $this->getResponse();

		}
		else {

			$this->redirectBack();
		}

	}
}
