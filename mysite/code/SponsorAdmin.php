<?php

class SponsorAdmin extends ModelAdmin {


  private static $managed_models = array('Sponsor'); 
  private static $url_segment = 'sponsor';
  private static $menu_title = 'Sponsors';
  private static $menu_icon = 'themes/afterclass2/images/CMSicons/sponsor.png';
  public $showImportForm = false; 
  


}
