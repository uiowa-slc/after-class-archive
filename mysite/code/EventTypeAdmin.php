<?php

class EventTypeAdmin extends ModelAdmin {


  private static $managed_models = array('Eventtype'); 
  private static $url_segment = 'eventtypes';
  private static $menu_title = 'Event Types';
  private static $menu_icon = 'themes/afterclass2/images/CMSicons/eventtype.png';
  public $showImportForm = false; 
  


}
