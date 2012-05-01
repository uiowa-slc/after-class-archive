<!doctype html>

<head>
	<% base_tag %>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,700italic,400,600,700' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Doppio+One' rel='stylesheet' type='text/css'>

	<title>Orientation  - After Class: The Best of UI's Culture, Events and Nightlife</title>

	<% require themedCSS(layout) %>
	<% require themedCSS(orientation) %>
	 
	<script src="{$ThemeDir}/js/jquery.min.js"></script>
	<script src="{$ThemeDir}/js/modernizr-2.0.6.min.js"></script>

</head>
<body>
<div id="fb-root"></div>
<script>
  window.fbAsyncInit = function() {
    FB.init({appId: '127918570561161', status: true, cookie: true,
             xfbml: true});
  };
  (function() {
    var e = document.createElement('script'); e.async = true;
    e.src = document.location.protocol +
      '//connect.facebook.net/en_US/all.js';
    document.getElementById('fb-root').appendChild(e);
  }());
  function loginnow() {
	  FB.login(function(response) {
		  if (response.session) {
			if (response.perms) {
			  // user is logged in and granted some permissions.
			  // perms is a comma separated list of granted permissions
			  javascript:location.reload(true);
			} else {
			  // user is logged in, but did not grant any permissions
			}
		  } else {
			// user is not logged in
		  }
		}, {perms:'email,sms'});
  }
  function logoutnow() {
	FB.api('/me', function(response) {
	  //if (response.first_name==undefined) {
	  //alert("Restart!")
	  //} else {
	 /* document.getElementById('Form_Form_first_name').value = response.first_name;
	  document.getElementById('Form_Form_last_name').value = response.last_name;
	  document.getElementById('Form_Form_email').value = response.email;
	  document.getElementById('Form_Form_facebook_id').value = response.id;
	  var myForm = document.getElementById('Form_Form');
	  myForm.submit();*/
	  FB.logout(function(response) {
	    //user is now logged out
	  });
	  //}
	  });
	
  }
</script>



	<div class="orientation-container">
		<img src="{$ThemeDir}/images/orientation/header.png" class="orientation-header" />
		<img src="{$ThemeDir}/images/orientation/stepone.png" class="orientation-step-one" />
		<div class="orientation-facebook">
		
		<fb:like-box profile_id="64131067165" width="500" stream="false" header="false" connections="16"></fb:like-box>
		
<!--<iframe src="//www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fuiowa.imu&amp;width=800&amp;height=258&amp;colorscheme=dark&amp;show_faces=true&amp;border_color=%23DDD7D8&amp;stream=false&amp;header=false&amp;appId=242901859120617" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:800px; height:258px;" allowTransparency="true"></iframe>-->
</div>
		<img src="{$ThemeDir}/images/orientation/steptwo.png" class="orientation-step-two" />

		<div class="orientation-form">
			$Form	
		</div>
		
		<p><a onClick="logoutnow();return false;" href="#">Logout</a></p>
		
	</div>

</body>
</html>