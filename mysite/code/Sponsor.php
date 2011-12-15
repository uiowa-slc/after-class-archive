<?php
class Sponsor extends Category {
	public static $belongs_many_many = array(
		"AfterClassEvents" => "AfterClassEvent"
	);
}
