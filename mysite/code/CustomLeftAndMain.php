<?php

use SilverStripe\Admin\CMSMenu;
use SilverStripe\Admin\LeftAndMainExtension;

class CustomLeftAndMain extends LeftAndMainExtension
{

    public function init()
    {
        // unique identifier for this item. Will have an ID of Menu-$ID
        $id = 'LinkToRebuild';

        // your 'nice' title
        $title = 'Rebuild Cache';

        // the link you want to item to go to
        $link = 'https://afterclass.uiowa.edu/dev/tasks/queue/SilverStripe-StaticPublishQueue-Task-StaticCacheFullBuildTask';

        // priority controls the ordering of the link in the stack. The
        // lower the number, the lower in the list
        $priority = -2;

        // Add your own attributes onto the link. In our case, we want to
        // open the link in a new window (not the original)
        $attributes = [
            'target' => '_blank'
        ];

        CMSMenu::add_link($id, $title, $link, $priority, $attributes);
    }
}