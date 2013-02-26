<section id="detail_feature" class="feature clearfix">

   			<% if Image %>
    	   		<img src="$Image.LargeImage.URL" class="detail_feature_image"/>
    	   	<% else %>
    	   		<img src="$ThemeDir/images/placeholder.png" class="detail_feature_image placeholder" />
    	   	<% end_if %>
            
    	   	<div class="event_group">
    	   
    	   	<div class="event_text">
    		<h2><strong>$Title</strong></h2>
    		<div class="event_details">

    	   	 		
    			<div id="dates">
    			
	    			<ul>
		    			<% control DateAndTime %> 
		    				<li>
				    			<a href="{$BaseHref}events/view/$StartDate.Format(Ymd)" class="date-link">
				    				<span>$StartDate.Format(l), $StartDate.Format(M). $StartDate.DayOfMonth</span>
				    			</a> 
				    				<% if StartTime %> at $StartTime.nice<% end_if %><% if EndTime %>, ends at $EndTime.nice<% end_if %>
			    			
				    			<% if EndDate %> until
				    				<a href="{$BaseHref}events/view/$EndDate.Format(Ymd)" class="date-link">
				    			 		<span>$EndDate.Format(l), $EndDate.Format(M). $EndDate.DayOfMonth</span>
				    			 	</a>
				    			<% end_if %> 
			    			</li>
	
		    			<% end_control %> <%-- end control DateAndTime --%>
		    		</ul>
    			</div><!-- end dates -->
    			<br />
    		$Location<br/>
    			
    			<ul class="venues">
	    			<% control Venues %>
	    				<li><a href="$Link">$Title</a></li>
	    			<% end_control %>
    			</ul>
    			<% if Sponsors %>
    				<div class="sponsors">
	    			<p>Sponsored by</p>
	    			<ul>
		    			<% control Sponsors %>
		    				<li><a href="$Link">$Title</a></li>
		    			<% end_control %>
	    			</ul>
	    		</div>
            	<% end_if %>
            	$Cost
            		<% if CancelReason %>
	<p><strong>Note: $CancelReason</strong></p>
	<% end_if %>
	</div>
	
	<div class="event-meta">
       	<% include EventCategoryList %>
	</div>
	<div style="clear: both"></div>

</div> 
		<div style="clear: both"></div>

       	</div>
	
          	<div style="clear: both"></div>
             <div class="addthis_toolbox addthis_default_style"
				addthis:url="{$AbsoluteLink}"
				addthis:title="{$Title}"
				addthis:description="">
				<a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
				<a class="addthis_button_google_plusone" g:plusone:size="medium"></a>
				<a class="addthis_button_tweet"></a>
				<a class="addthis_button_pinterest_pinit"></a>
				<a class="addthis_counter addthis_pill_style"></a>
			</div>
        				

    </section>



<section id="detail_event_description">
	
	<div id="detail_event_description_info">
		<h2>What's Happening?</h2>
		$Content
		
		<% if MoreInfoLink %>
		<p><a href="$MoreInfoLink" class="event-detail-button" target="_blank">More information</a></p>
		<% end_if %>
		<p><a href="{$BaseHref}feedback/" class="report-problem-link fancybox.iframe">Report a problem with this event</a></p>
	</div>
	
	
	<% if Venues %>

		<div id="detail_event_description_map">
	
		<h2>Where?</h2>
	
		<% control Venues %>
			<p>This event is located at: <a href="$Link">$Title</a></p>
			 
			<p><% if Address %><a href="http://www.google.com/maps?f=d&daddr=$Address">Get Directions &raquo;</a><% end_if %><% if WebsiteURL %> <br /> <a href="$WebsiteURL">Visit the $Title Website &raquo;</a><% end_if %></p>
			
			<% if Address %>
				<div id="map_canvas" style="width: 100%; height: 100%"></div>
			<% end_if %>
		<% end_control %>
		
	<% end_if %>


	
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
    
    <% if Lat %>
    var place = new google.maps.LatLng($Lat, $Lng);
    var myOptions = {zoom: 16,center: place,mapTypeId: google.maps.MapTypeId.ROADMAP};
    var map = new google.maps.Map(document.getElementById("map_canvas"),myOptions);
    var geomarker = new google.maps.Marker({ map: map, position: place });
    <% else %>
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({ 'address': address }, function (results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
      place = results[0].geometry.location;
      var myOptions = {zoom: 16,center: place,mapTypeId: google.maps.MapTypeId.ROADMAP};
      var map = new google.maps.Map(document.getElementById("map_canvas"),myOptions);
      var geomarker = new google.maps.Marker({ map: map, position: place });
      }
    });
    <% end_if %>
    <% end_control %>
  }
  window.onload = initialize();
</script>

	</div>
	<div class="clear"></div>
</section>


<% include RelatedEvents %>


