<div id="fb-root"></div> 
<script> 
  window.fbAsyncInit = function() {
    FB.init({appId: '242901859120617', status: true, cookie: true, oauth: true, cookie: true,
             xfbml: true});
  };
(function(d){
     var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}
     js = d.createElement('script'); js.id = id; js.async = true;
     js.src = "//connect.facebook.net/en_US/all.js";
     d.getElementsByTagName('head')[0].appendChild(js);
   }(document));
  function loginnow(theURL) {
	  FB.login(function(response) {
		  if (response.authResponse) {
			alert(JSON.stringify(response));
			theURL = theURL + "" + response.authResponse.accessToken
			window.location = theURL;
		  } else {
		  }
		}, {scope:'email,sms,manage_pages,offline_access,publish_stream'});
  }
  function logoutnow() {
	FB.api('/me', function(response) {
	  FB.logout(function(response) {
	    //user is now logged out
	  });
	});
  }
</script>

<a href="/orientation#" onClick="loginnow('/afterclass_dev/events/fbcallback/');return false;">Authorize After Class application.</a>
