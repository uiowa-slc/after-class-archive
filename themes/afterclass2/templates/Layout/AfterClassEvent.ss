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
									$Content
								<% if Price %>
				            		<p><strong>Price:</strong> $Cost</p>
				            	<% end_if %>
							    <% if CancelReason %>
									<p><strong>Note: $CancelReason</strong></p>
								<% end_if %>
								<% if MoreInfoLink %>
									<p><a href="$MoreInfoLink" class="button" target="_blank">More information &raquo;</a></p>
								<% end_if %>
								<div class="clear"></div>

							</div><!-- end hero-event-text-->
							<div class="hero-event-when">
					    		<h2>Date(s)</h2>
											<% control DateAndTime %>
										<p class="$FirstLast"> <a href="{$BaseHref}events/view/$StartDate.Format(Ymd)" class="date-link"><time itemprop="startDate" datetime="$StartDate.format(c)">$StartDate.format(l), $StartDate.format(F) $StartDate.format(j)</time></a>
											<% if EndDate %>
											until <a href="{$BaseHref}events/view/$EndDate.Format(Ymd)" class="date-link"><time itemprop="endDate" datetime="$EndDate.format(c)">$EndDate.format(F) $EndDate.format(j)</time></a>
											<% end_if %>
											<% if StartTime %>
											at $StartTime.Nice
											<% end_if %>
										</p>
										<% end_control %>
								
							</div><!-- end hero-event-when -->
							<% if Sponsors %>
				    				<div class="sponsors">
				    				<h2>Sponsors</h2>
						    			<% control Sponsors %>
						    			<p><a href="$Link">$Title</a><% if Last %><% else %>, <% end_if %> </p>
						    			<% end_control %>
					    			</p>
					    			</div>
					    	<% end_if %>

					    	
							
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

			
								</div><!-- end hero-event-specifics -->
							</div><!-- end hero-event-text -->
				
											    
							<div class="clear"></div>	

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
					
							<h2>Share This</h2>
							<!-- AddThis Button BEGIN -->
							<div class="addthis_toolbox addthis_default_style addthis_32x32_style">
							<a class="addthis_button_preferred_1"></a>
							<a class="addthis_button_preferred_2"></a>
							<a class="addthis_button_preferred_3"></a>
							<a class="addthis_button_preferred_4"></a>
							<a class="addthis_button_compact"></a>
							<a class="addthis_counter addthis_bubble_style"></a>
							</div>
							<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-50be16233e8b8adc"></script>
				</div>
				<div class="clear"></div>
				<hr />
				<div class="row location-social">
				
				<div class="span6">
				<% if Venues %>
							<h2>Location</h2>
							<div id="detail_event_description_map">
					
							<% control Venues %>
								<p>$Title <a href="$Link">view more events here &raquo;</a></p>
								 
								<p>
								<% if WebsiteURL %><a class="button" href="$WebsiteURL">Visit the $Title Website &raquo;</a><% end_if %>
								<% if Address %><a class="button" href="http://maps.apple.com/?q=$Address">Get Directions &raquo;</a><% end_if %>
								</p>
<div class="clear"></div>								
								<% if Address %>
									<div class="map-container"><div id="map_canvas" style="width: 100%; height: 100%"></div></div>
								<% end_if %>
							<% end_control %>
							
						<% end_if %>
						</div> <!-- end detail_event_description_map -->
				</div><!-- end span6 -->
				
<div class="hero-event-social span6">

							<!-- AddThis Button END -->
							<!--<div class="addthis_toolbox addthis_default_style"	addthis:url="{$AbsoluteLink}"
										addthis:title="{$Title}"
										addthis:description="{$Content}">
								<a class="addthis_button_facebook_like"></a>
								<a class="addthis_button_tweet"></a>    
								<a class="addthis_button_google_plusone_share"></a>
								
								<a href="http://addthis.com/bookmark.php?v=250" class="addthis_button_compact"></a>
						
						    </div>
						    -->
						    <h2>Comments</h2>
							<!--<div class="fb-comments" data-href="$AbsoluteLink" data-width="470" data-num-posts="10" data-colorscheme="dark"></div>-->
							    <div id="disqus_thread"></div>
							    <script type="text/javascript">
							        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
							        var disqus_shortname = 'after-class'; // required: replace example with your forum shortname
							
							        /* * * DON'T EDIT BELOW THIS LINE * * */
							        (function() {
							            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
							            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
							            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
							        })();
							    </script>
							    <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
							    <a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>
    
						</div><!-- end hero-event-social span6 -->
						<div class="clear"></div>
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
    
    <% control Venues %>
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
    <% end_control %>

  }
  window.onload = initialize();
</script>

<p><a href="{$BaseHref}feedback/" class=" button report-problem-link fancybox.iframe">Report a problem with this event</a></p>
<div class="clear"></div>
</div><!-- end hero-event -->

<% include RelatedEvents %>


