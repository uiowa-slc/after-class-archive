<?php
class Eventtype extends Category {
	private static $belongs_many_many = array(
		"AfterClassEvents" => "AfterClassEvent"
	);
	private static $summary_fields = array('Type');
	
	
}
