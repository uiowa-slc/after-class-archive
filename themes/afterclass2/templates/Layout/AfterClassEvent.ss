<div class="feature-background-wrapper">
	<div class="hero-event single" itemscope itemtype="http://data-vocabulary.org/Event">	
					<div class="hero-event-content">
					<h1><a href="$Link" itemprop="url"><span itemprop="summary">$Title</span></a></h1>
					<% if Eventtypes %><% control Eventtypes.First %><a class="event-header-category" href="$Link">$Title</a><% end_control %><% end_if %>
					<div class="clear"></div>
					<div class="hero-event-details">
							<div class="hero-event-text">
							
									$Content
									
				            	$Cost
							    <% if CancelReason %>
									<p><strong>Note: $CancelReason</strong></p>
								<% end_if %>
							</div><!-- end hero-event-text-->
						
							
								<div class="hero-event-specifics">
									<div class="hero-event-when">
											<% control DateAndTimeLimited(3) %>
										<p class="$FirstLast"> <a href="{$BaseHref}events/view/$StartDate.Format(Ymd)" class="date-link"><time itemprop="startDate" datetime="$StartDate.format(c)">$StartDate.format(F) $StartDate.format(j)</time></a>
											<% if EndDate %>
											until <a href="{$BaseHref}events/view/$EndDate.Format(Ymd)" class="date-link"><time itemprop="endDate" datetime="$EndDate.format(c)">$EndDate.format(F) $EndDate.format(j)</time></a>
											<% end_if %>
											<% if StartTime %>
											at $StartTime.Nice
											<% end_if %>
										</p>
										<% end_control %>
										
										
										<% if DateAndTimeMoreThan(3) %>
											<a href="{$Link}#dates" class="more-dates-link">view more dates &raquo;</a>
										<% end_if %>
										
									</div><!-- end hero-event-when -->
									
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
									</div><!-- end herp-event-where -->
									<div class="clear"></div>
								
								
								</div><!-- end hero-event-specifics -->
							</div><!-- end hero-event-text -->
				
									
						 <div class="addthis_toolbox addthis_default_style"	addthis:url="{$AbsoluteLink}"
									addthis:title="{$Title}"
									addthis:description="">
							<a class="addthis_button_facebook_like"></a>
							<a class="addthis_button_twitter"></a>    
							<a class="addthis_button_google_plusone_share"></a>
							
							<a href="http://addthis.com/bookmark.php?v=250" class="addthis_button_compact"></a>
					
					    </div><!-- end addthis_toolbox -->
					    
					<div class="clear"></div>	


					</div><!-- end hero-event-content -->
				
					
					<div class="hero-event-image-container">
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
		

<section id="detail_event_description">
	
	<div id="detail_event_description_info">

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
		<div class="event-meta">
			<% include EventCategoryList %>
		</div>
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


				</div><!-- end hero-event -->
				
			</div><!-- end feature-background-wrapper -->

	$Cost
							    <% if CancelReason %>
									<p><strong>Note: $CancelReason</strong></p>
								<% end_if %>

								<div class="event_details">
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




<% include RelatedEvents %>


