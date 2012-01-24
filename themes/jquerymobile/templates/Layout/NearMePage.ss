<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <article>
      <p>Finding your location: <span id="status">checking...</span></p>
      <!--<p>All Available Venues:</p>
      <ul>
      	<% control Venues %>
      		<li>$Title - $Address</li>
      	<% end_control %>
      </ul>-->
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
function success(position) {
  var s = document.querySelector('#status');
  
  if (s.className == 'success') {
    // not sure why we're hitting this twice in FF, I think it's to do with a cached result coming back    
    return;
  }
  
  s.innerHTML = "found you!";
  s.className = 'success';
  var mapWidth = ($(window).width()) - 40;
  
  
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
  //google.maps.event.addListener(map, 'click', function(){
  //  infoWindow.close();
  //});
  
/*makeMarker({
   position: myLatlng,
   title: 'Title',
   content: '<div><h1>Lorem ipsum</h1>Lorem ipsum dolor sit amet<div>'
});*/

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
		infowindow.setContent("<strong><a href='/categories/$Title'>$Title</a></strong><br /><% control Events(2) %><div style='font-size:11px;padding:2px 0px;'><a href='$Link'><% control Event %>$Title<% end_control %> - $StartDate.format(M). $StartDate.format(d)</a></div><% end_control %>");
		infowindow.open(map, this);
		});
		
		//makeMarker({
		//   position: results[0].geometry.location,
		//   title: 'Title',
		//   content: '<div><h1>Lorem ipsum</h1>Lorem ipsum dolor sit amet<div>'
		//});
        
        /*var geomarker = new google.maps.Marker({
            map: map,
            position: results[0].geometry.location
        });*/
        
        
      } else {
        //alert("Geocode was not successful for the following reason: " + status);
      }
    });
  
  <% end_control %>
  
}

function error(msg) {
  var s = document.querySelector('#status');
  s.innerHTML = typeof msg == 'string' ? msg : "failed";
  s.className = 'fail';
  
  // console.log(arguments);
}

if (navigator.geolocation) {
  navigator.geolocation.getCurrentPosition(success, error);
} else {
  error('not supported');
}

</script>