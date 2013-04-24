<div class="feature-background-wrapper">
	<div class="hero-event single" itemscope itemtype="http://data-vocabulary.org/Event">	
					<div class="hero-event-content">
					<h1><span itemprop="summary">$Title</span></h1>
					<div class="clear"></div>
					
					<div class="hero-event-image-container small-screen">
						<a href="$Link" class="img-shadow">
							<% if Image %>
								<% control Image %>
									<% control CroppedImage(235,151) %>
									<img itemprop="photo" src="$URL" />
									<% end_control %>
								<% end_control %>
							<% else %>
								<img itemprop="photo" src="$ThemeDir/images/placeholder.png" />
							<% end_if %>
						</a>
						<div class="clear"></div>
					</div>
					
					<div class="hero-event-details">
							<div class="hero-event-text">	

							    <% if CancelReason %>
									<p><strong>Note: $CancelReason</strong></p>
								<% end_if %>
									$Content
								<% if Price %>
				            		<p><strong>Price:</strong> $Cost</p>
				            	<% end_if %>
							    <% if CancelReason %>
									<p><strong>Note: $CancelReason</strong></p>
								<% end_if %>
							</div><!-- end hero-event-text-->
							<% if Sponsors %>
				    				<div class="sponsors">
					    			<p><strong>Sponsored by: </strong>
						    			<% control Sponsors %>
						    				<a href="$Link">$Title</a><% if Last %><% else %>, <% end_if %> 
						    			<% end_control %>
					    			</p>
					    			</div>
					    	<% end_if %>
					    									<div class="hero-event-when">
											<% control DateAndTime %>
										<p class="$FirstLast"> <a href="{$BaseHref}events/view/$StartDate.Format(Ymd)" class="date-link"><time itemprop="startDate" datetime="$StartDate.format(c)">$StartDate.format(F) $StartDate.format(j)</time></a>
											<% if EndDate %>
											until <a href="{$BaseHref}events/view/$EndDate.Format(Ymd)" class="date-link"><time itemprop="endDate" datetime="$EndDate.format(c)">$EndDate.format(F) $EndDate.format(j)</time></a>
											<% end_if %>
											<% if StartTime %>
											at $StartTime.Nice
											<% end_if %>
										</p>
										<% end_control %>
								
									</div><!-- end hero-event-when -->
					    	<% control Venues %>
								<p class="venues">
								<span itemprop="location" itemscope itemtype="http://data-vocabulary.org/​Organization">
								@ <% if Top.Location %>$Top.Location, <br /><% end_if %><a href="$Link"><span itemprop="name">$Title</span></a>
								</span>
								</p>
							<% end_control %>	
							
								<div class="hero-event-specifics">
	
									
									<div class="hero-event-where">
										<p>
										<% control Venues %>
											<p class="venues">
											<span itemprop="location" itemscope itemtype="http://data-vocabulary.org/​Organization">
											@ <a href="$Link"><span itemprop="name">$Title</span></a>
											</span>
											</p>
										<% end_control %>		
										</p>
												
										<% if Cost %>
											<p class="admission-price">Admission: <a href="$Link">$Cost </a></p>
										<% end_if %>	
									</div><!-- end hero-event-where -->
									<div class="clear"></div>
										<% if MoreInfoLink %>
										<p><a href="$MoreInfoLink" class="event-detail-button" target="_blank">More information</a></p>
										<% end_if %>
										<p><a href="{$BaseHref}feedback/" class="report-problem-link fancybox.iframe">Report a problem with this event</a></p>
			
								</div><!-- end hero-event-specifics -->
							</div><!-- end hero-event-text -->
				
						<hr />			
						 <div class="addthis_toolbox addthis_default_style"	addthis:url="{$AbsoluteLink}"
									addthis:title="{$Title}"
									addthis:description="">
							<a class="addthis_button_facebook_like"></a>
							<a class="addthis_button_twitter"></a>    
							<a class="addthis_button_google_plusone_share"></a>
							
							<a href="http://addthis.com/bookmark.php?v=250" class="addthis_button_compact"></a>
					
					    </div><!-- end addthis_toolbox -->
					    
					<div class="clear"></div>	

						<% if Venues %>
					
							<div id="detail_event_description_map">
					
							<% control Venues %>
								<p>This event is located at: <a href="$Link">$Title</a></p>
								 
								<p><% if Address %><a href="http://www.google.com/maps?f=d&daddr=$Address">Get Directions &raquo;</a><% end_if %><% if WebsiteURL %> <br /> <a href="$WebsiteURL">Visit the $Title Website &raquo;</a><% end_if %></p>
								
								<% if Address %>
									<div class="map-container"><div id="map_canvas" style="width: 100%; height: 100%"></div></div>
								<% end_if %>
							<% end_control %>
							
						<% end_if %>
						</div> <!-- end detail_event_description_map -->

					</div><!-- end hero-event-content -->
				
					
					<div class="hero-event-image-container big-screen">
						<a href="$Link" class="img-shadow">
							<% if Image %>
								<% control Image %>
									<% control CroppedImage(730,462) %>
									<img itemprop="photo" src="$URL" />
									<% end_control %>
								<% end_control %>
							<% else %>
								<img itemprop="photo" src="$ThemeDir/images/placeholder.png" />
							<% end_if %>
						</a>
						<div class="clear"></div>
					</div>
	
		
		<!--<% if DateAndTimeMoreThan(3) %>
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
		<% end_if %>-->
		
		<!--<div class="event-meta">
			<% include EventCategoryList %>
		</div>-->

		<div class="clear"></div>
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

  // Create an array of styles.
  var styles = [
    {
      stylers: [
        { hue: "#00ffe6" },
        { saturation: -20 }
      ]
    },{
      featureType: "road",
      elementType: "geometry",
      stylers: [
        { lightness: 100 },
        { visibility: "simplified" }
      ]
    },{
      featureType: "road",
      elementType: "labels",
      stylers: [
        { visibility: "off" }
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
    center: new google.maps.LatLng(55.6468, 37.581),
    mapTypeControlOptions: {
      mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']
    }
  };

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
	    center: new google.maps.LatLng(55.6468, 37.581),
	    mapTypeControlOptions: {
	      mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']
	    }
	  };
	  
	  
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
    
	  map.mapTypes.set('map_style', styledMap);
	  map.setMapTypeId('map_style');
  }
  window.onload = initialize();
</script>


</div><!-- end hero-event -->

<% include RelatedEvents %>


