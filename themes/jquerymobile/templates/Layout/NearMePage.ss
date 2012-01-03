<h2>Good morning, dave.</h2>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <article>
      <p>Finding your location: <span id="status">checking...</span></p>
      <p>All Available Venues:</p>
      <ul>
      	<% control Venues %>
      		<li>$Title - $Address</li>
      	<% end_control %>
      
      </ul>
    </article>
<script>
function success(position) {
  var s = document.querySelector('#status');
  
  if (s.className == 'success') {
    // not sure why we're hitting this twice in FF, I think it's to do with a cached result coming back    
    return;
  }
  
  s.innerHTML = "found you!";
  s.className = 'success';
  
  var mapcanvas = document.createElement('div');
  mapcanvas.id = 'mapcanvas';
  mapcanvas.style.height = '200px';
  mapcanvas.style.width = '300px';
    
  document.querySelector('article').appendChild(mapcanvas);
  
  var myLatlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
  var myOptions = {
    zoom: 15,
    center: myLatlng,
    mapTypeControl: false,
    navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("mapcanvas"), myOptions);
  
  var marker = new google.maps.Marker({
      position: myLatlng, 
      map: map, 
      title:"You are here!"
  });
  
  //geo-coding to convert our addresses to usable longitude/latitude
  
  var geocoder;
  geocoder = new google.maps.Geocoder();
  
  var address = "221 East Washington Street, Iowa City, IA 52240";
  alert (address);
  
   geocoder.geocode( { 'address': address}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        //map.setCenter(results[0].geometry.location);
        var geomarker = new google.maps.Marker({
            map: map,
            position: results[0].geometry.location
        });
      } else {
        alert("Geocode was not successful for the following reason: " + status);
      }
    });

  

  var testLatLng = new google.maps.LatLng(41.661736, -91.540017);
  
  var marker1 = new google.maps.Marker({
  		position: testLatLng,
  		map: map,
  		title: "TITLEEEE!!"
  	});
  
  
  <% control Venues %>

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