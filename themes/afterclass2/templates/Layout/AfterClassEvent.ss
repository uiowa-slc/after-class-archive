<div class="row">
<div class="feature-background-wrapper">
<div class="span8">
	<div class="hero-event single" itemscope itemtype="http://data-vocabulary.org/Event">	
		<div class="hero-event-image-container">
			<a href="$Link" class="img-shadow">
				<% if Image %>
					<% loop Image %>
						<% loop CroppedImage(730,462) %>
							<img itemprop="photo" src="$URL" />
						<% end_loop %>
					<% end_loop %>
				<% else %>
					<img itemprop="photo" src="$ThemeDir/images/placeholder.png" />
				<% end_if %>
			</a>

			<div class="clear"></div>
		</div><!-- end hero-event-image-container -->	

		<div class="hero-event-content">
			<h1><span itemprop="summary">$Title</span></h1>	
					
			<div class="hero-event-details">
				<div class="hero-event-text">
					<p>
						<% if UpcomingDatesAndRanges.Count > 1 %><strong>Next Date:</strong><% end_if %>
						<% if UpcomingDatesAndRanges %>
						<% loop UpcomingDatesAndRanges.First %>
							<% include HeroDateTimes %>
						<% end_loop %>
						<% else %>
							No upcoming dates.
						<% end_if %>
					</p>
					
					<% if Cost %>
	            		<p><strong>Price:</strong> $Cost</p>
	            	<% end_if %>
				    <% if CancelReason %>
						<p><strong>Note: $CancelReason</strong></p>
					<% end_if %>
					<% if MoreInfoLink %>
						<p><a href="$MoreInfoLink" class="button" target="_blank">More information</a></p>
					<% end_if %>
					$Content
				</div><!-- end hero-event-text-->
				
				<div class="hero-event-when">
				<% if $DateAndTime.Count > 1 %>
					<h2>All Dates</h2>
						<% loop $DateAndTime %>
							<p class="$FirstLast"><% include HeroDateTimes %>
							</p>
						<% end_loop %>
				<% end_if %>
				</div><!-- end hero-event-when -->
				
				
			</div><!-- end hero-event-details -->
			<hr />
			<% if RelatedEvents %>
				<% include RelatedEvents %>
			<% end_if %>
		</div><!-- end hero-event-content-->
	</div><!-- end hero-event -->

</div><!-- end span8 -->


<div class="span4">
	<% if Venues || Location %>
		<div id="detail_event_description_map">	
			<% if Location %><p>{$Location}</p><% end_if %>
			<% loop Venues %>
				
				<h2>@ $Title</h2>
				<div class="clear"></div>								
				<% if Address %>
					<div class="map-container"><div id="map_canvas" style="width: 100%; height: 100%"></div></div>
				<% end_if %>
				<p>
				<% if Address %>
					<a class="button get-directions" href="$DirectionsLink" target="_blank">Get Directions</a>
				<% end_if %>
				<% if WebsiteURL %>
					<a class="button" href="$WebsiteURL">Venue website</a>
				<% end_if %>
				<a href="$Link" class="button">More events here</a>
				</p>
			<% end_loop %>
			
		</div> <!-- end detail_event_description_map -->
	<% end_if %>
	<hr />
	<% include AddThis %>
<% if $PrimarySponsor %>
	<hr />
	<% with $PrimarySponsor %>
		<div>
			<img src="$LogoImage.URL" alt="sponsor image for $Title" class="PrimarySponsorImg"/>
		</div>
	<% end_with %>
	<hr />
<% end_if %>
		<% if Sponsors %>
			<div class="sponsors">
				<p><strong>Sponsored by:</strong><% loop Sponsors %>
				<a href="$Link">$Title</a><br />
				<% end_loop %></p>
			</p>
			</div>
		<% end_if %>
		<% if AllCategories %>
			<div class="categories">
					<p><strong>Tagged as:</strong>
					<% loop AllCategories %>
					<a href="$Link" class="button tag">$Title.LimitCharacters(25)</a>
					<% end_loop %></p>
				</p>
				</div>
		<% end_if %>
	<hr />
	<p><a href="{$BaseHref}feedback/" class="report-problem-link fancybox.iframe">Report a problem with this event</a></p>

</div><!-- end span4-->
</div><!-- end row -->
	
	
	
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
  
  
		 // Create an array of styles.
		var styles = [
			 
		{
		    "stylers": [
		      { "weight": 2.7 },
		      { "saturation": -71 },
		      { "invert_lightness": true },
		      { "visibility": "on" },
		      { "hue": "#8800ff" }
		    ]
		  },{
		    "elementType": "geometry",
		    "stylers": [
		      { "weight": 1.6 },
		      { "lightness": -20 },
		      { "saturation": -13 },
		      { "gamma": 1.33 }
		    ]
		  },{
		    "featureType": "road",
		    "elementType": "geometry.fill",
		    "stylers": [
		      { "color": "#000000" },
		      { "weight": 3.6 },
		      { "hue": "#a200ff" },
		      { "lightness": 38 },
		      { "saturation": -4 }
		    ]
		  },{
		    "featureType": "water",
		    "stylers": [
		      { "hue": "#00b2ff" },
		      { "lightness": -2 },
		      { "saturation": 27 }
		    ]
		  }
		 ];
	
	  // Create a new StyledMapType object, passing it the array of styles,
	  // as well as the name to be displayed on the map type control.
	  var styledMap = new google.maps.StyledMapType(styles,
	    {name: "Styled Map"});
	
	  // Create a map object, and include the MapTypeId to add
	  // to the map type control.
	  var mapOptions = {
	    zoom: 11,
	   scrollwheel: false,
	   draggable: false,
	    center: new google.maps.LatLng(55.6468, 37.581),
	    mapTypeControlOptions: {
	      mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']
	    }
	  };
	  
	  
    var place = null;
    
    <% loop Venues %>
    var address = "$Address";
    
    <% if Lat %>
    var place = new google.maps.LatLng($Lat, $Lng);
    var myOptions = {zoom: 16,center: place,mapTypeId: google.maps.MapTypeId.ROADMAP, scrollwheel: false, draggable: false
};
    var map = new google.maps.Map(document.getElementById("map_canvas"),myOptions);
    var geomarker = new google.maps.Marker({ map: map, position: place });
	  map.mapTypes.set('map_style', styledMap);
	  map.setMapTypeId('map_style');
    <% else %>
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({ 'address': address }, function (results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
      place = results[0].geometry.location;
      var myOptions = {zoom: 16,center: place,mapTypeId: google.maps.MapTypeId.ROADMAP,scrollwheel: false, draggable: false};
      var map = new google.maps.Map(document.getElementById("map_canvas"),myOptions);
      var geomarker = new google.maps.Marker({ map: map, position: place });
       
	  map.mapTypes.set('map_style', styledMap);
	  map.setMapTypeId('map_style');
      }
    });
    <% end_if %>
    <% end_loop %>

} 

window.onload = initialize();



</script>
</div><!-- end hero-event -->
</div><!-- end row -->




