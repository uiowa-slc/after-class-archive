<header id="secondary_header">
 	<h1>$Category.Title</h1>
</header>
 <div id="single-page-content" class="category">
 			
 			<div class="about-category">
	 			<% control Category %>
	
	 				<% if Address %>
		 				<div class="venue-map">	
							<div id="map_canvas" style="width: 100%; height: 100%"></div>				
		 				</div>
	 				<% end_if %>
				
				<div class="category-content" <% if Address %>style="margin-left: 20px"<% end_if %>>
					<% if Information %><p class="category-information">$Information</p><% end_if %>
					
				
					<% if Address %><p><a href="http://www.google.com/maps?f=d&daddr=$Address">Get Directions &raquo; </a></p><% end_if %>
					<% if Phone %><p>$Phone</p><% end_if %>
					
					<% if Email %><a href="mailto: $Email">$Email</a></p><% end_if %>

	 				<% if LinkURL %><p><a href="$LinkURL" target="_blank">Visit Website &raquo; </a></p><% end_if %>
	 				<% if WebsiteURL %><p><a href="$WebsiteURL" target="_blank">Visit the $Title Website &raquo;</a></p><% end_if %>
	 			
	 			</div><!-- end category-content -->
	 			
	 			<div class="clear"></div>
 			</div><!-- end about-category -->

		
		
		
		<% if ClassName = Sponsor %>
 			<h2>Current events sponsored by $Title:</h2>
 		<% else_if ClassName = Venue %>
 			<h2>Current events at $Title:</h2>
 			<style>
 				.where {
 					display: none;
 				
 				}
 			
 			</style>
 		<% else_if ClassName = Eventtype %>
 		
 		<% end_if %>	
		
		

		<div class="category-list">
		<!--<% control Events(2) %><div><% control Event %>$Title<% end_control %></div><% end_control %>-->
		<% if Events %>
		<ul class="category-list-events">
			<% control Events %>
				<% control Event %>
					<% include EventCard %>
				<% end_control %>
			<% end_control %>
		</ul>
		<div style="clear: both"></div>
		<!--<div class="view-all"><a href="{$BaseHref}events/categories/$Title">View All $Events.count Events</a></div>-->

			 <!--<a href="{$BaseHref}events/categories/$Title">View all $Events.count events</a>.-->
		<% else %>
			No events currently listed.
		<% end_if %>
	</div>
 </div>
<% end_control %>
	
<style type="text/css">

</style>
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
    
    <% control Category %>
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
