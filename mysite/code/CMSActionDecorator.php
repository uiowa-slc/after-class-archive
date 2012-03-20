<?php
class CMSActionDecorator extends LeftAndMainDecorator {
    function doFacebook(){
    	$id = (int)$_REQUEST['ID']; 
    	$Event = DataObject::get_by_id('AfterClassEvent', $id);
    	$Event->facebook_publish();
    	
        FormResponse::status_message(sprintf('Posted!'),'good');
        return FormResponse::respond();
    }   
}