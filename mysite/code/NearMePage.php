<?php
class NearMePage extends Page {

	public static $db = array(
	);
	public static $has_one = array(
	);
	
}
class NearMePage_Controller extends Page_Controller {

	/**
	 * An array of actions that can be accessed via a request. Each array element should be an action name, and the
	 * permissions or conditions required to allow the user to access it.
	 *
	 * <code>
	 * array (
	 *     'action', // anyone can access this action
	 *     'action' => true, // same as above
	 *     'action' => 'ADMIN', // you must have ADMIN permissions to access this action
	 *     'action' => '->checkAction' // you can only access this action if $this->checkAction() returns true
	 * );
	 * </code>
	 *
	 * @var array
	 */
	public static $allowed_actions = array (
	);

	/*public function PlaceList2(){

		$calendar = LocalistCalendar::get()->First();
		$allEvents = $calendar->EventList();

		foreach($allEvents as $key => $event){
			$venues[] = Array( $event->VenueTitle;

		}


	}*/

	public function UsesGoogleMaps(){
		return true;
	}
	public function PlaceList( $feedURL = "places/?pp=1000"){

		$cache = new SimpleCache();

		$feedURL = LOCALIST_FEED_URL.$feedURL;

		//print_r($feedURL);
		$placesList = new ArrayList();
		$rawFeed = $cache->get_data("VenueList", $feedURL);

		$placesDecoded = json_decode($rawFeed, TRUE);
		$placesArray = $placesDecoded['places'];
	
		foreach($placesArray as $place) {
			$venue = new LocalistVenue();
			$venue = $venue->parseVenue($place);
			if($venue->Events()->First()){
				$placesList->push($venue->parseVenue($place));
			}


		}

		return $placesList;   

	}

	

	public function init() {
		parent::init();	
	}
	
} 

