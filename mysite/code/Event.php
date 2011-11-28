<?php
/**
 * Defines the Minisite page type
 */
class Event extends DataObject {
	static $many_many = array (
		"Categories" => "Category"
	);
	public static $db = array(
	'Title' => 'Text',
	'Date' => 'Date',
	'Time' => 'Text',
	'Location' => 'Text',
	'Cost' => 'Text',
	'Headline' => 'Text',
	'Description' => 'HTMLText'
	);
	static $has_one = array(
	'Events' => 'EventsPage',
	'Image' => 'Image',
	'FeatureImage' => 'Image'
	);
	function getCMSFields_forPopup() {
		$fields = new FieldSet();
		$fields->push( new TextField('Title','Title of newsletter item.') );
		
		$datefield = new DateField('Date','Event date.');
		$datefield->setConfig('showcalendar', true);
		$fields->push($datefield);
		
		$fields->push( new TextField('Time','Time.') );
		$fields->push( new TextField('Location','Location') );
		$fields->push( new TextField('Cost','Cost of Admission') );
		$fields->push( new SimpleHTMLEditorField('Description','Details for the event.') );
		$fields->push( new ImageField('Image') );
		$fields->push( new ImageField('FeatureImage') );
		return $fields;
	}
	function PreviousEvents($amt = 2) {
		if (!$this->Date) {
			return new DataObjectSet();
		}
		$Parent = $this->getParent();
		$Date = date("Y-m-d",$this->Date);
		$Date = mysql_real_escape_string($this->Date);#Airdate < $this->Airdate
		return DataObject::get("Event", "ParentID = $Parent->ID AND Date < '$Date'", "Date DESC", Null, $amt);
	}
}

?>