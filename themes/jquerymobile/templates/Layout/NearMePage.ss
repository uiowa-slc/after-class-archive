<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <article>
      <p style="display:none;">Finding your location: <span id="status">checking...</span></p>
      <!--<p>All Available Venues:</p>
      <ul>
      	<% control Venues %>
      		<li>$Title - $Address</li>
      	<% end_control %>
      </ul>-->
      <div id="status"></div>
      $Content
      
      
      

    </article>

<script>

var markerArray = [];
var infoWindow = null;
function makeMarker(options){
   var pushPin = new google.maps.Marker({map:map});
   pushPin.setOptions(options);
   google.maps.event.addListener(pushPin, 'click', function(){
     infoWindow.setOptions(options);
     infoWindow.open(map, pushPin);
   });
   markerArray.push(pushPin);
   return pushPin;
}

/*function forcerefresh() {
  if (document.location.href.indexOf("r=1") == -1) {
    window.location = "http://hulk.imu.uiowa.edu/afterclass_dev/near-me/?r=1";
  }
}*/

function test() {
  /*var s = document.querySelector('#status');
  s.innerHTML = "IMU!";
  s.className = 'success';*/
  var mapWidth = ($(window).width()) - ($(window).width()/6);
  
  var mapcanvas = document.createElement('div');
  mapcanvas.id = 'mapcanvas';
  mapcanvas.style.height = '240px';
  mapcanvas.style.width = mapWidth+'px';
  document.querySelector('article').appendChild(mapcanvas);
  
  //var myLatlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
  var myLatlng = new google.maps.LatLng(41.661736, -91.540017);
  var myOptions = {
    zoom: 14,
    center: myLatlng,
    panControl: true,
    mapTypeControl: false,
    navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("mapcanvas"), myOptions);
  

  infowindow = new google.maps.InfoWindow({
  content: "holding..."
  });
  <% control Venues %>
  
  //geo-coding to convert our addresses to usable longitude/latitude  
  var geocoder;
  geocoder = new google.maps.Geocoder();
  var address = "$Address";
  
  <% if Lat %>
    var venueLatLng = new google.maps.LatLng($Lat, $Lng);
    var marker = new google.maps.Marker({
      map: map,
      position: venueLatLng
    });
    google.maps.event.addListener(marker, 'click', function () {
	infowindow.setContent("<strong><a href='/categories/$Title'>$Title</a></strong><br /><% control Events(2) %><div style='font-size:11px;padding:2px 0px;'><a href='$Link'><% control Event %>$Title<% end_control %> - $StartDate.format(M). $StartDate.format(j)</a></div><% end_control %>");
	infowindow.open(map, this);
	});
  <% else %>
    geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
        //map.setCenter(results[0].geometry.location);

		//var testLatLng = new google.maps.LatLng(41.661736, -91.540017);
		var marker = new google.maps.Marker({
            map: map,
            position: results[0].geometry.location
        });
		google.maps.event.addListener(marker, 'click', function () {
		infowindow.setContent("<strong><a href='/categories/$Title'>$Title</a></strong><br /><% control Events(2) %><div style='font-size:11px;padding:2px 0px;'><a href='$Link'><% control Event %>$Title<% end_control %> - $StartDate.format(M). $StartDate.format(j)</a></div><% end_control %>" + results[0].geometry.location);
		infowindow.open(map, this);
		});
		
      } else {
        //alert("Geocode was not successful for the following reason: " + status);
      }
    });
  <% end_if %>
  
  <% end_control %>
}




function success(position) {
  /*if (s.className == 'success') {
    // not sure why we're hitting this twice in FF, I think it's to do with a cached result coming back    
    return;
  }*/
  
  /*var s = document.querySelector('#status');
  s.innerHTML = "found you!";
  s.className = 'success';*/
  var mapWidth = ($(window).width()) - ($(window).width()/4);
  
  var mapcanvas = document.createElement('div');
  mapcanvas.id = 'mapcanvas';
  mapcanvas.style.height = '240px';
  mapcanvas.style.width = mapWidth+'px';
  document.querySelector('article').appendChild(mapcanvas);
  
  
  var myLatlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
  //var myLatlng = new google.maps.LatLng(41.661736, -91.540017);
  var myOptions = {
    zoom: 14,
    center: myLatlng,
    panControl: true,
    mapTypeControl: false,
    navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("mapcanvas"), myOptions);
  

  infowindow = new google.maps.InfoWindow({
  content: "holding..."
  });
  <% control Venues %>
  
  //geo-coding to convert our addresses to usable longitude/latitude  
  var geocoder;
  geocoder = new google.maps.Geocoder();
  var address = "$Address";
  
  geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
        //map.setCenter(results[0].geometry.location);

		var testLatLng = new google.maps.LatLng(41.661736, -91.540017);
		var marker = new google.maps.Marker({
            map: map,
            position: results[0].geometry.location
        });
		google.maps.event.addListener(marker, 'click', function () {
		infowindow.setContent("<strong><a href='/categories/$Title'>$Title</a></strong><br /><% control Events(2) %><div style='font-size:11px;padding:2px 0px;'><a href='$Link'><% control Event %>$Title<% end_control %> - $StartDate.format(M). $StartDate.format(j)</a></div><% end_control %>");
		infowindow.open(map, this);
		});
		
      } else {
        //alert("Geocode was not successful for the following reason: " + status);
      }
    });
  
  <% end_control %>
  
}

function error(msg) {
  /*var s = document.querySelector('#status');
  s.innerHTML = typeof msg == 'string' ? msg : "failed";
  s.className = 'fail';*/
  
  // console.log(arguments);
}

/*$(document).ready(function() {
  if (navigator.geolocation) {
	  navigator.geolocation.getCurrentPosition(success, error);
	} else {
	  error('not supported');
	}
});*/
$(document).ready(function() {
  test();
});
</script>