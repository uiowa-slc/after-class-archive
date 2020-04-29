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
		'AddForm',
		'add'
	);

	private static $url_handlers = array(
		// // 'year//$Year' => 'year',
		// 'ics' => 'ics'
		'add' => 'add'
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

	public function AddForm(){ 
        $fields = new FieldList( 
            new TextField('SocialLink', 'Social media link:'),
            new LiteralField('SocialLinkInfo', '<label class="readonly">We currently support links from <i aria-hidden="true" class="fab fa-twitter"></i> Twitter and <i aria-hidden="true" class="fab fa-instagram"></i> Instagram </label>'),
            DateField::create('Expires', 'Expiry date (optional):'),

            new LabelField('ExpiresLabel', 'We\'ll show this post on After Class until the date above. Usually this would be the day after the event. If unsure, please leave this field blank.'),
            $emailField = new EmailField('SubmitterEmail', "Your email address (optional, only used if we need to clarify anything regarding the event).")
        ); 
        $actions = new FieldList( 
            new FormAction('submit', 'Submit')
        ); 

        if ($member = Security::getCurrentUser()) {
        	
        	$emailField->setValue($member->Email);
        }

       
		$form = new Form($this, 'AddForm', $fields, $actions);

		//Disable captcha if logged in or in dev mode:
		if ((!Permission::check('CMS_ACCESS')) || Director::isLive()) {
		    $form->enableSpamProtection();
		}

         

        return $form; 
    }

    public function submit($data, $form) { 

    	$link = $data['SocialLink'];

    	$existingLinkCheck = CalendarEvent::get()->filter(array('SocialLink' => $link))->First();

    	//Only check for existing links in live mode
		if (Director::isLive()) {
	    	if($existingLinkCheck){

		       	$data = new ArrayData(array(
		            	'Alert' => '<div class="alert alert-failure">Sorry, this social media link has already been submitted.</div>',
		            	'Form' => ''
		        ));

		        return $this->customise($data)->renderWith(array('Calendar_add', 'Page'));

	    	}
		}

    	//Check for invalid link:
    	if (filter_var($link, FILTER_VALIDATE_URL) === false) {
	       	$data = new ArrayData(array(
	            	'Alert' => '<div class="alert alert-warning">Sorry, this is not a valid link.</div>',
	            	'Form' => ''
	        ));

	        return $this->customise($data)->renderWith(array('Calendar_add', 'Page'));
		}

		//Check for invalid domain in link:
		$parsedLink = parse_url($link);
		$validDomains = array('instagram.com', 'www.instagram.com', 'twitter.com', 'www.twitter.com');
		
		if(!in_array($parsedLink['host'], $validDomains)){

	       	$data = new ArrayData(array(
	            	'Alert' => '<div class="alert alert-warning">Sorry, we are currently only accepting Instagram and Twitter posts.</div>',
	            	'Form' => ''
	        ));

	        return $this->customise($data)->renderWith(array('Calendar_add', 'Page'));

		}

		//print_r($parsedLink);

    	$newEvent = CalendarEvent::create();
    	$newEvent->ParentID = $this->ID;

    	$formData = $form->getData();
    	$form->saveInto($newEvent);

    	$newEvent->writeToStage('Stage');

    	//Injector::inst()->get(LoggerInterface::class)->debug('Query executed: ' . $sql);
    	// print_r($formData);

    	$this->sendNotificationEmail($data, $newEvent);
    	$data = new ArrayData(array(
    			'Alert' => '<div class="alert alert-success" role="alert">'.$this->SubmissionThanks.'</div>',
            	'Form' => ''
        ));
        return $this->customise($data)->renderWith(array('Calendar_add', 'Page'));

    }


    private function sendNotificationEmail($data, $newEvent){

    	$recipients = $this->EmailRecipients();

    	foreach($recipients as $recipient){
			    	
	    	$email = new Email(); 
	         
	        $email->setTo($recipient->EmailAddress); 
	        $email->setReplyTo($newEvent->SubmitterEmail);
	        $email->setSubject("[Social Calendar Submission] A link was submitted"); 
	         //TODO: Show some of the newly parsed link data in the email below:
	        $messageBody = " 
	        	<p>The following link was submitted to the After Class submit-a-post form: </p>
	            <p><strong>Social Media Link:</strong> <a href=\"{$data['SocialLink']}\">{$data['SocialLink']}</a></p>";

			if($newEvent->SubmitterEmail){
				$messageBody .= '<p><strong>Link submitted by:</strong> <a href="mailto:'.$newEvent->SubmitterEmail.'">'.$newEvent->SubmitterEmail.'</a>';
			}
			if($newEvent->Expires){
				$messageBody .= '<p><strong>Link expires on:</strong> '.$newEvent->obj('Expires')->Nice().'</p>';
			}
			$messageBody.="
				<p><a href=\"admin/pages/edit/show/".$newEvent->ID."\">You can either publish or remove this post by editing this entry on After Class &rarr;</a>
				</p>"; 
	        $email->setBody($messageBody); 
	        // print_r($newEvent->SubmitterEmail);
	        // print_r($newEvent->Expires);
	        // print_r($messageBody);
	        $email->send(); 
    	}
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
