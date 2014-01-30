<?php
 
class CustomSiteConfig extends DataExtension {
     
    /*
### @@@@ UPGRADE REQUIRED @@@@ ###
FIND: function extraStatics
NOTE:  Remove me: simply define static vars on extension directly, or use add_to_class()   
### @@@@ ########### @@@@ ###
*/function extraStatics() {
        return array(
            'db' => array(
                "TaglineOption1" => "Text",
                "TaglineOption2" => "Text",
                "TaglineOption3" => "Text",
                "TaglineOption4" => "Text",
                "TaglineOption5" => "Text",
                "TaglineOption6" => "Text",
                "TaglineOption7" => "Text",
                "TaglineOption8" => "Text",
                "TaglineOption9" => "Text",
                "TaglineOption10" => "Text",
            )
        );
    }
 
    public function updateCMSFields(FieldList $fields) {
        $fields->addFieldToTab("Root.Main", new TextField("TaglineOption1", "Tagline Option 1"));
        $fields->addFieldToTab("Root.Main", new TextField("TaglineOption2", "Tagline Option 2"));
        $fields->addFieldToTab("Root.Main", new TextField("TaglineOption3", "Tagline Option 3"));
        $fields->addFieldToTab("Root.Main", new TextField("TaglineOption4", "Tagline Option 4"));
        $fields->addFieldToTab("Root.Main", new TextField("TaglineOption5", "Tagline Option 5"));
        $fields->addFieldToTab("Root.Main", new TextField("TaglineOption6", "Tagline Option 6"));
        $fields->addFieldToTab("Root.Main", new TextField("TaglineOption7", "Tagline Option 7"));
        $fields->addFieldToTab("Root.Main", new TextField("TaglineOption8", "Tagline Option 8"));
        $fields->addFieldToTab("Root.Main", new TextField("TaglineOption9", "Tagline Option 9"));
        $fields->addFieldToTab("Root.Main", new TextField("TaglineOption10", "Tagline Option 10"));

    }
}