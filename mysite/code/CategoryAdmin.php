<?php

class CategoryAdmin extends ModelAdmin {


  private static $managed_models = array('Venue','Sponsor','Eventtype'); 
  private static $url_segment = 'event-categories';
  private static $menu_title = 'Event Categories';
  private static $menu_icon = 'themes/tutor/images/pencil.png';
  public $showImportForm = false; 
  


}
