<!--<header id="detail_header"><h1>Movies</h1></header>-->

<section id="detail_feature" class="feature clearfix">
			<% if Image %>
    	   		<img src="$Image.LargeImage.URL" class="detail_feature_image"/>
    	   	<% else %>
    	   		<img src="$ThemeDir/images/placeholder.png" class="detail_feature_image placeholder" />
    	   	<% end_if %>
    	   	
    	   	<% if Categories %>
    	   	<div class="event_categories">
            	<ul>
            		<li>test</li>
            		<li>test</li>
            	</ul>
            </div>
            <% end_if %>
    	   	<div class="event_group">
    	   	<div class="event_text">
    		<h2><strong>$Title</strong></h2>
    		<p class="event_details">
    		
    			<% control DateAndTime %>$StartDate.Month $StartDate.DayOfMonth <% if StartTime %> at $StartTime.nice<% end_if %><br /><% end_control %>
    			
    			<br />
            	$Location<br/>
            	$Cost</p> 

                  
       	</div>
       	
       	<div class="event_date_tag">
       		<a href="#">
       		<% control DateAndTime %>
			<% if First %>
			<div class="event_date_box">$StartDate.format(M)<strong>$StartDate.format(d)</strong> $StartDate.format(D)</div>
			<% end_if %>
        	<% end_control %>
       		</a>
            <ul>
            	<li class="share_facebook"><a href="#">Facebook</a></li>
                <li class="share_rss"><a href="#">RSS</a></li>
                <li class="share_twitter"><a href="#">Twitter</a></li>
                <li class="share_email"><a href="#">Email</a></li>
            </ul>
       
        </div>       
   
			</div>
		<!--<div id="detail_carousel">
			<div class="carousel_thumb">
			<a href="#"><img src="http://dummyimage.com/96x81"/></a>
			</div>
			<div class="carousel_thumb">
			<a href="#"><img src="http://dummyimage.com/96x81"/></a>
			</div>
			<div class="carousel_thumb">
			<a href="#"><img src="http://dummyimage.com/96x81"/></a>
			</div>
			<div class="carousel_thumb_last">
			<a href="#"><img src="http://dummyimage.com/96x81"/></a>
			</div>
		</div>-->
		
    </section>


<section id="detail_event_description">
	
	<div id="detail_event_description_info">
	<h2>What's Happening?</h2>
	$Content
	</div>
	<div id="detail_event_description_map">
	<h2>Where?</h2>
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
    var address = "IMU, Iowa City, IA";
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
      
    }
    });
  }
  window.onload = initialize();
</script>
	
</section>


<section id="detail_related_events">
	<h2>Related Events</h2>
	
	<% control RelatedEvents %>
	  <% control Event %>
	  <div class="related_event">
		<a href="$Link"><% if Image %><img src="$Image.SmallImage.URL"/><% else %><img src="$ThemeDir/images/placeholder_small.png" /> <% end_if %>
		<h3><strong>$Title</strong> @ $Location</h3></a>
	  </div>
	  <% end_control %>
	<% end_control %>
	
	<!--<div class="related_event">
		<a href="#"><img src="http://dummyimage.com/201x170"/>
		<h3><strong>Kenan Thompson</strong> @ Hubbard Park</h3></a>
	</div>-->
</section>


