<!doctype html>
<html>
<head>
	<% base_tag %>
	<title>Orientation  - After Class: The Best of UI's Culture, Events and Nightlife</title>
	<link href="{$ThemeDir}/css/master.css" rel='stylesheet' type='text/css'>
</head>
<body class="orientation">
	<div class="orientation-container">
		<div class="row orientation-form">
			<div class="medium-6 columns after-logo ">
				<img src="{$ThemeDir}/images/after-class-logo.png" class="orientation-header" />
			</div>
			<div class="medium-6 columns after-form">
				<div class="alert-area"><p>Thanks!</p></div>
				$Form	
			</div>
		</div>
	</div>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$( ".alert-area p" ).delay(1500).fadeOut( "slow");
	});	
</script>

</body>
</html>