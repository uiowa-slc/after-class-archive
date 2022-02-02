<?php

use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Forms\LabelField;
use SilverStripe\Forms\TextField;
class UiCalendarNewsletter extends Page {

    private static $db = array(

        'HeaderText' => 'HTMLText',
        'FooterText' => 'HTMLText',

        'Event1' => 'Int',
        'Event2' => 'Int',
        'Event3' => 'Int',
        'Event4' => 'Int',
        'Event5' => 'Int',
        'Event6' => 'Int',
        'Event7' => 'Int',
        'Event8' => 'Int',

        'SocialPost1' => 'Int',
        'SocialPost2' => 'Int',
        'SocialPost3' => 'Int',
        'SocialPost4' => 'Int',
        'SocialPost5' => 'Int',
        'SocialPost6' => 'Int',
        'SocialPost7' => 'Int',
        'SocialPost8' => 'Int',

        'NonFeaturedEvent1' => 'Int',
        'NonFeaturedEvent2' => 'Int',
        'NonFeaturedEvent3' => 'Int',
        'NonFeaturedEvent4' => 'Int',
        'NonFeaturedEvent5' => 'Int',
        'NonFeaturedEvent6' => 'Int',
        'NonFeaturedEvent7' => 'Int',
        'NonFeaturedEvent8' => 'Int',
    );

    private static $has_one = array(

    );

    private static $default_sort = 'Created DESC';
    private static $defaults = array (

    );
    private static $singular_name = 'Social Newsletter';
    private static $plural_name = 'Social Newsletters';
    private static $summary_fields = array(
        'Title',
        'Created'

    );
    private static $show_in_sitetree = false;
    private static $allowed_children = [];

    public function summaryFields(){
        return array('Title', 'Created');
    }
    public function getCMSFields() {
        $fields = parent::getCMSFields();
        $calendar = UiCalendar::getOrCreate();

        $eventsArray = array();
        $socialPostsArray = array();

        $fields->removeByName('Content');
        $fields->removeByName('Content');
        $fields->removeByName('Metadata');
        $fields->removeByName('LayoutType');
        $fields->removeByName('BackgroundImage');


        //$fields->addFieldToTab('Root.Main', new TextField('HeaderText'));
        $fields->addFieldToTab('Root.Main', HTMLEditorField::create('HeaderText')->setRows(3)->addExtraClass('stacked'));
        $fields->addFieldToTab('Root.Main', HTMLEditorField::create('FooterText')->setRows(3)->addExtraClass('stacked'));


        $events = $calendar->EventList();


        //Need to map differently here in order to let social posts have a primary key of their link (hacky way to uniquely id them for now)

        if ($events->First()) {

            $eventsArray = $events->map()->toArray();

            foreach($eventsArray as $eventKey => $eventVal){

                //print_r($eventKey.'<br />');

                $eventObj = $events->filter(array('ID' => $eventKey))->First();

                if($eventObj && $eventObj->Dates){
                    if($eventObj->Dates->First()){

                        $eventFirstDateTime = $eventObj->Dates->First()->StartDateTime->Nice();
                        $eventsArray[$eventKey] = $eventVal.' - '.$eventFirstDateTime;
                    }

                }
            }
        }

        $socialPosts = $calendar->SocialEventList()->sort('Created DESC');

        if($socialPosts->First()){
            $socialPostsArray = $socialPosts->map()->toArray();

            foreach($socialPostsArray as $socialKey => $socialVal){

                $socialObj = $socialPosts->filter(array('ID' => $socialKey))->First();

                $socialPostsArray[$socialKey] = $socialVal.' - Created on '.$socialObj->obj('Created')->Nice();
            }
        }

        $numEvents = 8;

        for($i = 1; $i <= $numEvents; $i++){

            $eventField = new DropdownField( "Event".$i, "Event ".$i, $eventsArray);
            $eventField->setEmptyString( '(No Event)' );
            $fields->addFieldToTab( 'Root.Main', $eventField );

            // Remove social fields for now since they  don't work
            // $socialPostField = new DropdownField( "SocialPost".$i, "Social ".$i, $socialPostsArray);
            // $socialPostField->setEmptyString( '(No Event)' );
            // $fields->addFieldToTab( 'Root.Main', $socialPostField );

        }




            $nfEvent1Field = new DropdownField( "NonFeaturedEvent1", "Nonfeatured Event 1", $eventsArray);
            $nfEvent1Field->setEmptyString( '(No Event)' );
            $fields->addFieldToTab( 'Root.Main', $nfEvent1Field );

            $nfEvent2Field = new DropdownField( "NonFeaturedEvent2", "Nonfeatured Event 2", $eventsArray);
            $nfEvent2Field->setEmptyString( '(No Event)' );
            $fields->addFieldToTab( 'Root.Main', $nfEvent2Field );

            $nfEvent3Field = new DropdownField( "NonFeaturedEvent3", "Nonfeatured Event 3", $eventsArray);
            $nfEvent3Field->setEmptyString( '(No Event)' );
            $fields->addFieldToTab( 'Root.Main', $nfEvent3Field );

            $nfEvent4Field = new DropdownField( "NonFeaturedEvent4", "Nonfeatured Event 4", $eventsArray);
            $nfEvent4Field->setEmptyString( '(No Event)' );
            $fields->addFieldToTab( 'Root.Main', $nfEvent4Field );

            $nfEvent5Field = new DropdownField( "NonFeaturedEvent5", "Nonfeatured Event 5", $eventsArray);
            $nfEvent5Field->setEmptyString( '(No Event)' );
            $fields->addFieldToTab( 'Root.Main', $nfEvent5Field );

            $nfEvent6Field = new DropdownField( "NonFeaturedEvent6", "Nonfeatured Event 6", $eventsArray);
            $nfEvent6Field->setEmptyString( '(No Event)' );
            $fields->addFieldToTab( 'Root.Main', $nfEvent6Field );

            $nfEvent7Field = new DropdownField( "NonFeaturedEvent7", "Nonfeatured Event 7", $eventsArray);
            $nfEvent7Field->setEmptyString( '(No Event)' );
            $fields->addFieldToTab( 'Root.Main', $nfEvent7Field );

            $nfEvent8Field = new DropdownField( "NonFeaturedEvent8", "Nonfeatured Event 8", $eventsArray);
            $nfEvent8Field->setEmptyString( '(No Event)' );
            $fields->addFieldToTab( 'Root.Main', $nfEvent8Field );


        return $fields;
    }

    //Don't cache newsletters
    public function urlsToCache() {
        return [];
    }
}
