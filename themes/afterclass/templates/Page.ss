<!doctype html>
<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js ie7 oldie" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8 oldie" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
	<% base_tag %>
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyB6ZQYL6TQGH7SLLvJRM9pQwOk5G6glKLE&sensor=false"></script>
	
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title>$Title - After Class: The Best of UI's Culture, Concerts and Nightlife</title>
	<meta name="description" content="Iowa City Movies, Iowa City Concerts, Lectures, and Campus Events">
	<meta name="author" content="IMU Marketing &amp; Design">

	<meta name="viewport" content="width=device-width,initial-scale=1">

	<% require themedCSS(layout) %> 
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="js/libs/modernizr-2.0.6.min.js"></script>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,700italic,400,600,700' rel='stylesheet' type='text/css'>
	
<script>



$(document).ready(function() {
  $('#upcoming_scroll_indicator').hide();

$('#upcoming_event_list').hover(function() {
  $('#upcoming_scroll_indicator').toggle('fast', function() {
    // Animation complete.
  });
});



});


</script>
	
	
	
</head>
<body>


<% include StudentLifeBar %>
<header id="page_header">
	<div class="container">
		<div class="big_header"><a href="$BaseHref">After Class</a></div>
	    <p class="subheader">The best of <em>UI</em>'s culture, concerts, and nightlife</p>
	    
	<form id="SearchForm_SearchForm" action="{$BaseHref}/events/SearchForm" method="get" enctype="application/x-www-form-urlencoded">
	<fieldset>
		<legend></legend>
		
			<div id="Search" class="field text  nolabel"><div class="middleColumn"><input type="text" class="text nolabel" id="SearchForm_SearchForm_Search" name="Search" placeholder="Search for an event" ></div></div>
		
		
			<input class="action " id="SearchForm_SearchForm_action_results" type="submit" name="action_results" value="Go" title="Go">
		
	</fieldset>
</form>
	    
	</div>
</header>
<nav id="page_navigation">
<% cached %>
	<div class="container">
	<ul class="clearfix">

		<li><a href="{$BaseHref}"><strong>Home</strong> <span>Complete event list</span></a></li>
		<li>
			<a href="events/category/"><strong>Category</strong><span>The type of event</span></a>
			<ul>
				<% control getEventtypes %>
					<% if Showmenu %>
					<% if Events %>
					<li><a href="all-events/categories/$Title">$Title</a></li>
					<% end_if %>
					<% end_if %>
				<% end_control %>
			</ul>
		</li>
		<li>
			<a href="events/sponsor/"><strong>Sponsor</strong><span>Who puts it on</span></a>
			<ul>
				<% control getSponsors %>
					<% if Showmenu %>
					<% if Events %>

					<li><a href="all-events/categories/$Title">$Title</a></li>
					<% end_if %>
					<% end_if %>
				<% end_control %>
			</ul>
		</li>
		<li>
			<a href="events/venue/"><strong>Venue</strong><span>Where it takes place</span></a>
			<ul>
				<% control getVenues %>
					<% if Showmenu %>
					<% if Events %>

					<li><a href="all-events/categories/$Title">$Title</a></li>
					<% end_if %>
					<% end_if %>
				<% end_control %>
			</ul>
		</li>
		<% control Menu(1) %>
			<% if First %>
			<% else_if URLSegment == near-me %>
			
			<% else %>
			
			<li>
				<a href="$Link"><strong>$Title</strong> $MenuTitle</a>
			</li>
			<% end_if %>
		<% end_control %>
    </ul>
    </div>
</nav>
<% end_cached %>
<!--cut out header and nav-->
<div id="page_content">
	<div class="container clearfix">
	$Layout
	
    <div>
	
	</div>
	
   </div>
</div>
<footer id="page_footer">
	<div class="container">
		<div id="ui_logo">
			<a href="http://www.uiowa.edu"> <img src="{$ThemeDir}/images/ui_logo.png" alt="The University of Iowa Logo" /></a>
		</div>
		<ul>
			<li><a href="{$BaseHref}/events/category">Category</a></li>
			<li><a href="{$BaseHref}/events/category">Sponsor</a></li>
			<li><a href="{$BaseHref}/events/category">Venue</a></li>
			<li><a href="{$BaseHref}/events/">All Events</a></li>
		</ul>
	</div>
</footer>






<script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/libs/jquery-1.6.2.min.js"><\/script>')</script>

<!-- scripts concatenated and minified via ant build script-->
<script src="js/plugins.js"></script>
<script src="js/script.js"></script>
<!-- end scripts-->

<script>
	var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']]; // Change UA-XXXXX-X to be your site's ID
	(function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];g.async=1;
	g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
	s.parentNode.insertBefore(g,s)}(document,'script'));
</script>

<!--[if lt IE 7 ]>
	<script src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.2/CFInstall.min.js"></script>
	<script>window.attachEvent("onload",function(){CFInstall.check({mode:"overlay"})})</script>
<![endif]-->

</body>
</html>
