<?php

use SilverStripe\ORM\ArrayList;

class UiCalendarNewsletterController extends PageController {

    public function FeaturedEvents(){
        $calendar = UiCalendar::getOrCreate();
        $eventList = new ArrayList();
        $socialEventList = new ArrayList();

        $numEvents = 8;

        for($i = 1; $i <= $numEvents; $i++){
            $propertyName = "Event".$i;
            $event = $calendar->SingleEvent($this->{$propertyName});
            //print_r($event->ClassName);
            //print_r($event);
            if($event){
                $eventList->push($event);
            }

            $propertyName = "SocialPost".$i;
            $post = CalendarEvent::get()->filter(array('ID' => $this->{$propertyName}))->First();

            if($post){
                $eventList->push($post);
            }
        }
        // print_r($eventList);
        return $eventList;
    }

    public function NonFeaturedEvents(){

        $calendar = UiCalendar::getOrCreate();
        $eventList = new ArrayList();
        $numEvents = 8;

        for($i = 1; $i <= $numEvents; $i++){
            $propertyName = "NonFeaturedEvent".$i;

            $event = $calendar->SingleEvent($this->{$propertyName});
            //print_r($event);
            if($event){
                $eventList->push($event);
            }
        }
        // print_r($eventList);
        return $eventList;
    }
}
