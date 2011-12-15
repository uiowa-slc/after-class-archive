<?php
class Venue extends Category {
	public static $belongs_many_many = array(
		"AfterClassEvents" => "AfterClassEvent"
	);
}
