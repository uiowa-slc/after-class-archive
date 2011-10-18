<?php

 class AfterClassCalendar extends Calendar
 {
/* static $has_many = array (
 'EventCategories' => 'EventCategory'
 );*/
 
 static $allowed_children = array (
 'AfterClassEvent'
 );
 
 
 } 
 
class AfterClassCalendar_Controller extends Calendar_Controller
 {
 }