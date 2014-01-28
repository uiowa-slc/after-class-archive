<?php

global $project;
$project = 'mysite';

global $database;
$database = 'afterclass2';
 
// Use _ss_environment.php file for configuration
require_once("conf/ConfigureFromEnv.php");

Calendar::add_extension('CalendarExtension');
CalendarEvent::add_extension('CalendarEventExtension');


// Set the site locale
i18n::set_locale('en_US');