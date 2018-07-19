<?php
use SilverStripe\CMS\Controllers\ContentController;
use SilverStripe\View\Requirements;
class PageController extends ContentController {

	protected function init() {
		parent::init();
		 
		//Block all requirements because we're building them with grunt now.
		// Requirements::block('event_calendar/css/calendar_widget.css');
		// Requirements::block('event_calendar/css/calendar.css');
		// Requirements::block('division-bar/js/_division-bar.js');
		// Requirements::block('framework/thirdparty/jquery/jquery.js');
		// Requirements::block('event_calendar/javascript/calendar.js');
		// Requirements::block('event_calendar/javascript/calendar_widget.js');
		// Requirements::block('event_calendar/javascript/lang/calendar_en.js');
		// Requirements::block('event_calendar/javascript/calendar_widget_init.js');
	
 	}
	
	public function results($data, $form){
		$term = $form->getSearchQuery();
		$calendar = $this->Calendar();
		$events = $calendar->EventList('year');
		//print_r($events);
		$results = $events->filterAny(array('EventTitle:PartialMatch' => $term, 'Content:PartialMatch' => $term));

		$data = array( 
			"Results" => $results,
			"Term" => $term
		);

	    return $this->customise( $data )->renderWith( array( 'UiCalendar_search', 'Page' ) );

	}
	public function EditURL(){
		return "/admin/pages/show/".$this->ID."/";
	}
}
