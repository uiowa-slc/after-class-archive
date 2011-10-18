<?php
class EventCategory extends DataObject {

	public static $db = array(
		"Title" => "Varchar(155)"
	);
	public static $belongs_many_many = array(
	
		"AfterClassEvents" => "AfterClassEvent"
	
	);

}
