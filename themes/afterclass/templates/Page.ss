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
	<script src="{$ThemeDir}/js/jquery.min.js"></script>
	<script src="{$ThemeDir}/js/modernizr-2.0.6.min.js"></script>
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

<style type="text/css">

header
,nav
,section
,article
,aside
,footer
,hgroup 
{ 
display: block;
}
 


</style>
	
	<!--[if lt IE 9]>
<script>
document.createElement('header');
document.createElement('nav');
document.createElement('section');
document.createElement('article');
document.createElement('aside');
document.createElement('footer');
document.createElement('hgroup');
</script>
<![endif]-->
	
	
</head>
<body>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1&appId=242901859120617";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>


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
		<!--
		<% control Menu(1) %>
			<% if First %>
			<% else_if URLSegment == near-me %>
			
			<% else %>
			
			<li>
				<a href="$Link"><strong>$MenuTitle</strong> $Title</a>
			</li>
			<% end_if %>
		<% end_control %>-->
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
	
		<div id="dsl-info">
			<div id="logo-container">
				<a href="http://www.uiowa.edu" class="uiowa-logo"> <img src="{$ThemeDir}/images/ui_logo.png" alt="The University of Iowa Logo" /></a> 
				<a href="http://studentlife.uiowa.edu/"><img src="{$ThemeDir}/images/dsl_logo.png" alt="The University of Iowa Logo" /></a>  
			</div>
			<p>319-335-3557<br />
			vp-student-life@uiowa.edu<br />
			Site designed by IMU Marketing + Design
			
			</p>
			
			
		</div>
		<ul>
			<li><a href="{$BaseHref}/events/category">Category</a></li>
			<li><a href="{$BaseHref}/events/category">Sponsor</a></li>
			<li><a href="{$BaseHref}/events/category">Venue</a></li>
			<li><a href="{$BaseHref}/events/">All Events</a></li>
			<li><a href="{$BaseHref}/add/">Submit an Event</a></li>

		</ul>
		<div style="clear: both"></div>
		<div id="footer-social-media">
			<div class="fb-like" data-send="true" data-width="450" data-show-faces="true" data-colorscheme="dark"></div>
			
			<a href="https://twitter.com/share" class="twitter-share-button" data-hashtags="AfterClass">Tweet</a>
			<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
			
			
			
			
		</div>
		
	</div>
</footer>


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
