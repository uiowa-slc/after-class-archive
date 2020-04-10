<?php
class SocialController extends \SilverStripe\Control\Controller
{
    private static $url_handlers = [
        'social/$@' => 'index',
    ];

    public function index($request)
    {

    	return $this->renderWith(array('SocialController', 'Page'));
    }
}