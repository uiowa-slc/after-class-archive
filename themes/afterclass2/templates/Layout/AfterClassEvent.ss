<% include HeroEvent %>



<section id="detail_event_description">
	
	<div id="detail_event_description_info">
		<h2>What's Happening?</h2>
		$Content
		
		<% if MoreInfoLink %>
		<p><a href="$MoreInfoLink" class="event-detail-button" target="_blank">More information</a></p>
		<% end_if %>
		<p><a href="{$BaseHref}feedback/" class="report-problem-link fancybox.iframe">Report a problem with this event</a></p>
		
		<% if DateAndTimeMoreThan(3) %>
		
		<h2 id="dates">All Dates and Times </h2>
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
		<% end_if %>

		
		
		
	</div>
	
	
	<% if Venues %>

		<div id="detail_event_description_map">
	
		<h2>Where?</h2>
	
		<% control Venues %>
			<p>This event is located at: <a href="$Link">$Title</a></p>
			 
			<p><% if Address %><a href="http://www.google.com/maps?f=d&daddr=$Address">Get Directions &raquo;</a><% end_if %><% if WebsiteURL %> <br /> <a href="$WebsiteURL">Visit the $Title Website &raquo;</a><% end_if %></p>
			
			<% if Address %>
			
				<div class="map-container"><div id="map_canvas" style="width: 100%; height: 100%"></div></div>
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


