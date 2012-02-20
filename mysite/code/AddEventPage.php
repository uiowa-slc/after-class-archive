<?php
class AddEventPage extends Page {
	public static $db = array(
	);
	public static $has_one = array(
	);
	static $has_many = array(
	);
	function getCMSFields() {
		$fields = parent::getCMSFields();
		//$fields->removeFieldFromTab('Root.Content', 'Content'); // remove a field from a tab
		
		return $fields;
	}
	
}
class AddEventPage_Controller extends Page_Controller {
	public static $allowed_actions = array (
	);
	public function init() {
		parent::init();
	}
	public function submittedEvent() {
		if(Session::get('Submitted')) {
        	return true;
    	} else {
    		return false;
    	}
	}
	public function addEventForm() {
		$fields = new FieldSet(
            new TextField('Title','Name of Event'),
            new TextField('Location','Location of Event'),
            new TextField('Submitterdate','Date or dates of Event'),
            new TextField('Cost','How much does it cost to attend?'),
            new TextField('Content','Describe what the event is about.'),
            new TextField('Sponsor','Who is sponsoring or hosting the event?'),
            new FileField('Image','Event Image (450 x 380 pixels is preferred)'),
            new TextField('Submittername','What is your name in case we need more info?'),
            new TextField('Submitteremail','What is your email address in case we need more info?')
        );
        $actions = new FieldSet(
            new FormAction('addEvent', 'Submit')
        );
        $validator = new RequiredFields('Title','Location','Cost','Description','Submittername','Submitteremail','Submitterdate');
     	$form = new Form($this, 'addEventForm', $fields, $actions, $validator);
     	
     	SpamProtectorManager::update_form($form);
        return $form;
	}
	function addEvent($data, $form) {
		$event = new AfterClassEvent();
	    $event->setParent(6);

        $form->saveInto($event);
        
        $event->writeToStage("Stage");
        Session::set('Submitted', true);
        
        
        //Email notification
		
		$from = "After Class Submissions";
		$to = "dustin-quam@uiowa.edu, benjamin-lewis@uiowa.edu, afterclass@uiowa.edu";
		$subject = "New After Class Event Submitted.";
		$body = '<p>Someone submitted an After Class Event. This is the event information:</p>
		
				<ul>
				
					<li>'.$event->Title.'</li>
					<li>'.$event->Content.'</li>
					
				</ul>
				
				<p><a href="http://afterclass.uiowa.edu/admin/show/'.$event->ID.'">Approve it (or don\'t) here</a></p>';
			
		
		$email = new Email($from, $to, $subject, $body);
		
		
		$email->send();

        
        
        Director::redirect('/thanks');
		
	}
}