<?php
class Tag extends DataObject {

	public static $db = array(
		"Title" => "Varchar(155)"
	);
	public static $belongs_many_many = array(
	
		"AfterClassEvents" => "AfterClassEvent"
	
	);
	
	function getEvents(){
	  return $this->AfterClassEvents();
	
	}

}
