<?php

class CalendarDateTimeExtension extends DataExtension {

   public function updateCMSFields(FieldList $fields) {
   		$owner = $this->owner;
   		print_r($this->owner);

	   	    $suggestedDateField = new LiteralField("SuggestedDate", "Suggested Date from the submitter: ".$this->owner->Event()->Submitterdate);
	        $fields->push($suggestedDateField);
    }

}