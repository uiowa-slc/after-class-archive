<?php

class VenueAdmin extends ModelAdmin {


  private static $managed_models = array('Venue'); 
  private static $url_segment = 'venues';
  private static $menu_title = 'Venues';
  private static $menu_icon = 'themes/afterclass2/images/CMSicons/venue.png';
  public $showImportForm = false; 
  


}
