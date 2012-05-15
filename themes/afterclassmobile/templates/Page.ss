<!doctype html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
	<% base_tag %>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,700italic,400,600,700' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Doppio+One' rel='stylesheet' type='text/css'>
		<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;" />

			<title><% if CategoryName %> $CategoryName - <% end_if %>
		
			<% if Action = category %>
				Categories - 
			<% else_if Action = venue %>
				Venues - 
			<% else_if Action = sponsor %>
				Event Sponsors -
			<% end_if %> 
			$Title  - After Class: The Best of UI's Culture, Events and Nightlife
		</title>
<% if Content %>
		<meta name="description" content="$Content.NoHTML">
	<% else %>
		<meta name="description" content="Iowa City Movies, Iowa City Concerts, Lectures, and Campus Events">
	<% end_if %>	
	<meta name="author" content="IMU Marketing &amp; Design">
	<% require themedCSS(style) %>
	<script src="js/libs/modernizr-2.5.3-respond-1.1.0.min.js"></script>
</head>

<body>
	<div id="header-container">
		<header class="wrapper clearfix">
			<div class="header-titles">
				<h1 id="title"><a href="{$BaseHref}">after class</a></h1>
				<!--<span id="subheader"> The Best of UI's Culture, Events and Nightlife</span> -->
				<div class="clear"></div>

			</div>
			<nav id="sticker">
				<ul>
			<li><a href="{$BaseHref}/events/">home</a></li>				
			<li><a href="{$BaseHref}/events/categories/"><strong>categories</strong></a></li>
			<li><a href="{$BaseHref}/events/sponsors">sponsors</a></li>
			<li><a href="{$BaseHref}/events/venues">venues</a></li>
			<li><a href="{$BaseHref}/events/add">add</a></li>
			
					<div class="clear"></div>
				</ul>
			</nav>
			<div class="clear"></div>
		</header>
	</div>
	<div id="main-container">
		<div id="main" class="wrapper clearfix">
			$Layout
		</div> <!-- #main -->
	</div> <!-- #main-container -->

	<div id="footer-container">
		<footer class="wrapper">
			<div class="disability-statement"><p>Individuals with disabilities are encouraged to attend all University of Iowa-sponsored events. If you are a person with a disability who requires an accommodation in order to participate in this program, please contact <a href="mailto:nancy-abram@uiowa.edu">Nancy Abram</a> in advance at 319-335-3414.</p></div>
			
		<ul>
			<li class="first"><a href="{$BaseHref}/events/category">Categories</a></li>
			<li><a href="{$BaseHref}/events/sponsors">Sponsors</a></li>
			<li><a href="{$BaseHref}/events/venues">Venues</a></li>
			<li><a href="{$BaseHref}/events/">All Events</a></li>
			<li><a href="{$BaseHref}/add/">Submit an Event</a></li>
			<% if FutureDeadlines %>
			<li><a href="{$BaseHref}deadlines/">Upcoming Deadlines</a></li>
			<% end_if %>

		</ul>
		<div class="clear"></div>
			<div id="dsl-info">
			<div id="logo-container">
				<a href="http://www.uiowa.edu" class="uiowa-logo"> <img src="{$ThemeDir}/images/ui_logo.png" alt="The University of Iowa Logo" /></a> 
				<a href="http://studentlife.uiowa.edu/"><img src="{$ThemeDir}/images/dsl_logo.png" alt="The University of Iowa Logo" /></a>  
			</div>
			<p>319-335-3414<br />
			<a href="mailto:afterclass@uiowa.edu">afterclass@uiowa.edu</a><br />
			Site designed by IMU Marketing + Design
			
			</p>
			

		</div>
		<div class="clear"></div>

		</footer>
	</div>
	
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="{$ThemeDir}/js/libs/jquery-1.7.2.min.js"><\/script>')</script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-426753-41']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<script src="{$ThemeDir}/js/script.js"></script>
<script src="{$ThemeDir}/js/jquery.sticky.js"></script>

<script>
 /* $(document).ready(function(){
    $("#sticker").sticky({topSpacing:0});
  });*/
</script>

</body>
</html>
