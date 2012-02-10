<section id="detail_feature" class="feature clearfix">
			<% if Image %>
    	   		<img src="$Image.LargeImage.URL" class="detail_feature_image"/>
    	   	<% else %>
    	   		<img src="$ThemeDir/images/placeholder.png" class="detail_feature_image placeholder" />
    	   	<% end_if %>
    	   	

            
    	   	<div class="event_group">
    	   	<div class="event_text">
    		<h2><strong>$Title</strong></h2>
    		<p class="event_details">
    		
    			<% control DateAndTime %> 
	    			<a href="{$BaseHref}events/view/$StartDate.Format(Ymd)" class="date-link">
	    				$StartDate.Format(l), $StartDate.Format(M). $StartDate.DayOfMonth 
	    				<% if StartTime %> at $StartTime.nice<% end_if %>
	    			</a> 
    			
	    			<% if EndDate %> - 
	    				<a href="{$BaseHref}events/view/$EndDate.Format(Ymd)" class="date-link">
	    			 		$EndDate.Format(l),$EndDate.Format(M). $EndDate.DayOfMonth
	    			 	</a>
	    			 	
	    			 <% end_if %> 
	    			 <br />
	    			 
    			<% end_control %>
    			
    			<br />
    			
    			<% control Venues %>
    				$Title <br />
    			<% end_control %>
    			
            	$Location<br/>
            	$Cost</p> 
                  
       	</div>
       	

       	
       	<div class="event_date_tag">
       		<a href="{$BaseHref}events/view/$StartDate.Format(Ymd)" class="date-link">
       		<% control UpcomingDates(1) %>
       			<% if StartDate %>
					<div class="event_date_box">$StartDate.format(M)<strong>$StartDate.format(j)</strong> $StartDate.format(D)</div>
				<% end_if %>
        	<% end_control %>
       		</a>
   				<% include ShareLinks %>
        </div>       
          	<div style="clear: both"></div>
       	<% include EventCategoryList %>
			</div>
		
    </section>


<section id="detail_event_description">
	
	<div id="detail_event_description_info">
	<h2>What's Happening?</h2>
	$Content
	</div>
	<div id="detail_event_description_map">
	<h2>Where?</h2>
	
	<% control Venues %>
	<p>This event is located at: <br />$Title - <a href="http://www.google.com/maps?f=d&daddr=$Address">Get Directions</a><% if WebsiteURL %>, <a href="$WebsiteURL">Visit Website</a><% end_if %></p>
	<% end_control %>
	<div id="map_canvas" style="width: 100%; height: 100%"></div>
	
	
	</div>

	
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyB6ZQYL6TQGH7SLLvJRM9pQwOk5G6glKLE&sensor=false">
</script>
<script type="text/javascript">
  var place = null;
  
  function GetLocation(address) {
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({ 'address': address }, function (results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        //ParseLocation(results[0].geometry.location);
        return results[0].geometry.location;
      } else {
        alert('error: ' + status);
      }
    });
  }
  function initialize() {
    //var thelocation = GetLocation("Iowa Memorial Union, Iowa City, IA");
    //var latlng = new google.maps.LatLng(41.6626698, -91.5383739);
    //alert(thelocation.lat().toString().substr(0, 12));
    //var latlng = new google.maps.LatLng(thelocation.lat(),thelocation.lng());
    var place = null;
    
    <% control Venues %>
    var address = "$Address";
    <% end_control %>
    
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({ 'address': address }, function (results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      place = results[0].geometry.location;
      
      var myOptions = {
      zoom: 16,
      center: place,
      mapTypeId: google.maps.MapTypeId.ROADMAP
      };
      var map = new google.maps.Map(document.getElementById("map_canvas"),myOptions);
      
      var geomarker = new google.maps.Marker({
          map: map,
          position: place
      });
      
    }
    });
  }
  window.onload = initialize();
</script>
		<div style="clear: left;" class="clear"></div>

</section>


<% include RelatedEvents %>


