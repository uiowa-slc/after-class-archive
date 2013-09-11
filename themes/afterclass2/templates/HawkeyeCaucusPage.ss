<!doctype html>

<head>
	<% base_tag %>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,700italic,400,600,700' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Doppio+One' rel='stylesheet' type='text/css'>

	<title>Hawkeye Caucus</title>

	<% require themedCSS(HawkCaucus) %>
	 
	<script src="{$ThemeDir}/js/jquery.min.js"></script>
	<script src="{$ThemeDir}/js/modernizr-2.0.6.min.js"></script>

</head>
<body class = "background">
<div id="fb-root"></div>
<script>
  window.fbAsyncInit = function() {
    FB.init({appId: '127918570561161', status: true, cookie: true,
             xfbml: true});
  };
  
  //handle a session response from any of the auth related calls
function handleSessionResponse(response) {
    //if we dont have a session (which means the user has been logged out, redirect the user)
    if (!response.session) {
        window.location = "/mysite/Login.aspx";
        return;
    }

    //if we do have a non-null response.session, call FB.logout(),
    //the JS method will log the user out of Facebook and remove any authorization cookies
    FB.logout(handleSessionResponse);
}
  
  
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
			  //javascript:location.reload(true);
			} else {
			  // user is logged in, but did not grant any permissions
			  //javascript:location.reload(true);
			}
		  } else {
			// user is not logged in
		  }
		  javascript:location.reload(true);
		}, {perms:'email'});
  }
  function logoutnow() {
	FB.api('/me', function(response) {
	  //if (response.first_name==undefined) {
	  //alert("Restart!")
	  //} else {
	  document.getElementById('Form_Form_first_name').value = response.first_name;
	  document.getElementById('Form_Form_last_name').value = response.last_name;
	  document.getElementById('Form_Form_email').value = response.email;
	  document.getElementById('Form_Form_facebook_id').value = response.id;
	  var myForm = document.getElementById('Form_Form');
	  myForm.submit();
	  FB.logout(function(response) {
	    //user is now logged out
	  });
	  //}
	  });
	
  }
</script>



	<div class="caucus-container">
		
		<div class= "logo">
			<img src="{$ThemeDir}/images/HawkCaucus/logo.png" class="caucus-header" />
		</div>
	
		<div class="caucus-content">
			
			<div class="caucus-form">
			<h4 class="widget2 backcolr"> Don't have Facebook? Fill this out!</h4>
				<div class ="caucusPad">
					
						$Form
				</div>
			</div>
			
		
			
			<div class="caucus-steps">
			<h4 class="widget backcolr"> Find us on Facebook</h4>
			<ol>
				<li class="step-one"><a href="#" onclick="loginnow();return false;" class="caucus-button">sign in with facebook</a></li>
				<li class="step-two"><p>like us!</p>
					<div class="caucus-facebook">
					
						<fb:like-box href="https://www.facebook.com/UIHawkeyeCaucus" width="600" colorscheme="dark" show_faces="true" border_color="#555555"  stream="false" header="false" connections="16"></fb:like-box>
					</div>
				</li>
				<li class="step-three"><a onClick="logoutnow();return false;" href="#" class="caucus-button logout">sign out</a></li>
			
			</ol>
		
		
		</div>

		
	</div>
	</div>
</body>
</html>