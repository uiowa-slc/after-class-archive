{
   "events":[
      {<% loop $Events %><% with $Event %>
         "event":{
            "id":"{$ID}",
            "link":"{$AbsoluteLink}",
            "more_info_link":"{$MoreInfoLink}",
            "image":"{$Image.CroppedImage(730,462).AbsoluteURL}",
            "small_image:":"{$Image.SmallImage.AbsoluteURL}",
            "cancel_note":"{$CancelReason}",
            "dates":[],
            "price": "{$Cost}",
            "location" : "{$Location}",
            "venues" : [
               {<% loop $Venues %>
                  "venue":{
                     "name":"<% if not $AltTitle %>{$Title}<% else %>{$AltTitle}<% end_if %>",
                     "address":"{$Address}",
                     "info":"{$Information.XML}",
                     "contact_email":"{$Email}",
                     "contact_phone":"{$Phone}",
                     "website_link":"{$WebsiteURL}",
                     "lat":"{$Lat}",
                     "lng":"{$lng}"
                  }<% if not $Last %>,<% end_if %>
               <% end_loop %>}
            ],
            "event_types" :[
               {<% loop $Eventtypes %>
                  "event_type":{
                     "name":"<% if not $AltTitle %>{$Title}<% else %>{$AltTitle}<% end_if %>",
                     "info": "{$Information.XML}"
                  }<% if not $Last %>,<% end_if %>
               <% end_loop %>}
            ],
            "sponsors":[
               {<% loop $Sponsors %>
                  "sponsor":{
                     "name":"<% if not $AltTitle %>{$Title}<% else %>{$AltTitle}<% end_if %>",
                     "info": "{$Information.XML}",
                     "website_link": "{$LinkURL}"
                  }<% if not $Last %>,<% end_if %>
               <% end_loop %>}
            ]
         }<% end_with %><% if not $Last %>,<% end_if %><% end_loop %>
      }
   ]
}