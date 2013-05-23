<!doctype html>

<head>

	<% base_tag %>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,700italic,400,600,700' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Doppio+One' rel='stylesheet' type='text/css'>
	<!--<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />-->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	
	<% if CategoryName %>
	<% control Category %>
		<% if ClassName = Sponsor %>
		<link rel="canonical" href="{$BaseHref}events/sponsors/$URLSlug" />
		<% else_if ClassName = Venue %>
		<link rel="canonical" href="{$BaseHref}events/venues/$URLSlug" />
		<% else_if ClassName = Category %>
		<link rel="canonical" href="{$BaseHref}events/categories/$URLSlug" />
		<% end_if %>
	<% end_control %>
	<% end_if %>
	
	<% if ClassName = AfterClassEvent %>
	<meta property="og:title" content="$Title"/>
	<meta property="og:type" content="activity"/>
	<meta property="og:image" content="$Image.LargeImage.AbsoluteURL"/>
	<meta property="og:url" content="$AbsoluteLink"/>
	<meta property="og:site_name" content="After Class"/>
	<meta property="og:app_id" content="242901859120617"/>
	<% end_if %>
	<title><% if CategoryName %>$Category.Title
		<% control Category %>
		<% if ClassName = Sponsor %>
		- University of Iowa Event Sponsor - 
		<% else_if ClassName = Venue %>
		- Event Venue - 
		<% else_if ClassName = Category %>
		- Upcoming -
		<% end_if %>
		<% end_control %>
	<% else %>
		<% control Category %><% if First %>
		<% if ClassName = Sponsor %>
		Event Sponsors - 
		<% else_if ClassName = Venue %>
		Venues - 
		<% else %>
		Categories - 
		<% end_if %>
		<% end_if %><% end_control %>
	<% end_if %>
	<% if ClassName = AfterClassEvent %>
	$Title - 
	<% end_if %>
	<% if ClassName = FeaturedAfterClassEvent %>
	$Title - 
	<% end_if %>
	After Class: the best source for University of Iowa events &amp; Iowa City events, culture, nightlife, and more!</title>

	<% if Content %>
		<meta name="description" content="$Content.NoHTML">
		<% if Category.Information %>
		<meta name="keywords" content="$Category.Title, Iowa City Movies, Iowa City Events, Iowa City Concerts, Lectures, and Campus Events" />
		<% end_if %>
	<% else %>
		<% if CategoryName %>
			<% if Category.Information %>
				<meta name="description" content="<% control Category %>$Information.XML<% end_control %>" />
			<% else %>
				<meta name="description" content="After Class is the biggest list of University of Iowa events, culture, nightlife, concerts, lectures, and more." />
			<% end_if %>
			<meta name="keywords" content="$Category.Title, Iowa City Movies, Iowa City Events, Iowa City Concerts, Lectures, and Campus Events" />
		<% else %>
			<meta name="description" content="After Class is the biggest list of University of Iowa events, culture, nightlife, concerts, lectures, and more." />
			<meta name="keywords" content="Iowa City Movies, Iowa City Concerts, Lectures, and Campus Events" />
		<% end_if %>
	<% end_if %>
	<meta name="author" content="IMU Marketing &amp; Design">


	<% if iswindows %>
	<% require themedCSS(windows) %>
	<% end_if %>

<style type="text/css">


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


</style>
<meta name="viewport" content="initial-scale = 1.0,maximum-scale = 1.0" />
</head>
<body>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1&appId=347095148660849";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<script type="text/javascript">
  (function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/plusone.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  })();
</script>


<% include DivisionBar %>
<a href="{$BaseHref}feedback" class="fancybox.iframe" id="feedback-link"><img src="{$ThemeDir}/images/feedback.png" /></a>
<header id="page_header">
	<div class="container" id="canvas-container">
		<canvas id="canvas"></canvas>
		<div class="big_header"><a href="$BaseHref"><img src="{$ThemeDir}/images/afterclass_logo.png" /></a></div>
	    <p class="subheader">$RandomTagline</p>
	</div>
</header>

<nav id="page_navigation">

	<div class="container">
	<ul class="clearfix">
		<li class="first" ><a href="{$BaseHref}">Home</a></li>
		<li class="first moon-icon" ><a href="{$BaseHref}"><img src="{$ThemeDir}/images/moon_icon.png"></a></li>
		<li id="news"><a href="news/">news</a></li>
		<li><a href="nearby/" class="near-me-link">Nearby</a></li>
		<li class="today"><a href="$TodayLink">Today</a></li>
		<li class="weekend"><a href="$WeekendLink">Weekend</a></li>
		<li><a href="{$Link}#" id="calendar-expand">Beyond</a></li>
		
		<li><a href="{$BaseHref}subscribe/" class="subscribe-link" data-fancybox-type="iframe">Subscribe</a></li>
		<% control Menu(1) %>
			<% if First %>
			<% else %>
			<li class="$URLSegment">
				<a href="$Link"><strong>$MenuTitle</strong></a>
				<% if Children %>
					<ul>
						<% control Children %>
							<li><a href="$Link" <% if RedirectionType = External %>class="external" target="_blank"<% end_if %> >$Title</a></li>
						<% end_control %>
					</ul>
				<% end_if %>
			</li>
			<% end_if %>
		<% end_control %>

		</ul>
		<div class="clear"></div>
		
		<div class="secondary-nav">
		
			<div id="calendar-filter-form">
				$CalendarWidget
			</div>
			<div class="filters">
				<form id="SearchForm_SearchForm" action="{$BaseHref}events/SearchForm" method="get" enctype="application/x-www-form-urlencoded">
					<fieldset>
						<legend></legend>
							<div id="Search" class="field text  nolabel"><div class="middleColumn"><input type="text" class="text nolabel" id="SearchForm_SearchForm_Search" name="Search" placeholder="Search for an event"></div></div>
							<input class="action " id="SearchForm_SearchForm_action_results" type="submit" name="action_results" value="Go" title="Go">
					</fieldset>
				</form>

				<h3>Trending Categories</h3>
					<p><% control getEventtypes %>
						<% if Events %>
							<a href="$Link">$Title</a> | 
						<% end_if %>
					<% end_control %></p>
				<h3>View Events By</h3>
				<ul>
					<li><a href="{$BaseHref}events/categories/">Categories</a></li>
					<li><a href="{$BaseHref}events/sponsors/">Sponsors</a></li>
					<li><a href="{$BaseHref}events/venues/">Venues</a></li>
				</ul>
			</div>
		</div>
		
		
   <div style="clear: both"></div>
 </div><!-- end container -->
</nav>

<!--cut out header and nav-->
<div id="page_content" class="{$ClassName} <% if action %>$action<% end_if %>">
	<div class="container clearfix">
	$Layout
	
    <div>
	
	</div>
	
   </div>
</div>
<footer id="page_footer">
	<div class="container">
	<div class="disability-statement"><p>Individuals with disabilities are encouraged to attend all University of Iowa-sponsored events. If you are a person with a disability who requires an accommodation in order to participate in this program, please contact <a href="mailto:nancy-abram@uiowa.edu">Nancy Abram</a> in advance at 319-335-3414.</p></div>
		<div id="dsl-info">
			<div id="logo-container">
				<a href="http://www.uiowa.edu" class="uiowa-logo"> <img src="{$ThemeDir}/images/ui_logo.png" alt="The University of Iowa Logo" /></a> 
				<a href="http://studentlife.uiowa.edu/"><img src="{$ThemeDir}/images/dsl_logo.png" alt="The University of Iowa Logo" /></a>  
			</div>
			<p>319-335-3414<br />
			<a href="mailto:afterclass@uiowa.edu">afterclass@uiowa.edu</a><br />
			<a href="http://studentlife.uiowa.edu/md/" target="_blank">Site designed by Student Life Marketing + Design</a>
			
			</p>
			
			
		</div>
		<ul>
			<li><a href="{$BaseHref}events/categories">Categories</a></li>
			<li><a href="{$BaseHref}events/sponsors">Sponsors</a></li>
			<li><a href="{$BaseHref}events/venues">Venue</a></li>
			<li><a href="{$BaseHref}events/">All Events</a></li>
			<li><a href="{$BaseHref}add/">Submit an Event</a></li>
			<% if FutureDeadlines %>
			<li><a href="{$BaseHref}deadlines/">Upcoming Deadlines</a></li>
			<% end_if %>

		</ul>
		<!--<div style="clear: both"></div>-->
		<div id="footer-social-media">
		
		
<!-- Begin MailChimp Signup Form -->

<script type="text/javascript">
	// delete this script tag and use a "div.mce_inline_error{ XXX !important}" selector
	// or fill this in and it will be inlined when errors are generated
	var mc_custom_error_style = '';
</script>

<div id="mc_embed_signup">

	<form action="http://uiowa.us2.list-manage.com/subscribe/post?u=c61b1cddac92babd42d7d628e&amp;id=8e3635391c" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank">
	
		<fieldset>
			<div id="mce-responses" class="newsletter-responses">
				<div class="response" id="mce-error-response" style="display:none"></div>
				<div class="response" id="mce-success-response" style="display:none"></div>
			</div>
			
			<div class="mc-field-group" class="newsletter-inputs">
				<input type="text" value="" name="EMAIL" class="required email" id="mce-EMAIL" placeholder="Email address..." />
				<input type="submit" value="Get our weekly newsletter" name="subscribe" id="mc-embedded-subscribe" class="btn" />
			</div>
		</fieldset>
	
	</form>

</div>

<!--End mc_embed_signup-->
 

			<a href="https://twitter.com/share" class="twitter-share-button" data-hashtags="AfterClass">Tweet</a>
			<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
			
			
			
			
		</div>
		<div class="clear"></div>
	</div>
</footer>

<% if CurrentMember %>
	<% if EditUrl %>
		<div id="editpage"><a id="edit-link" target="_blank" href="$EditURL">Edit This</a></div>
	<% end_if %>
<% end_if %>

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
<script type="text/javascript">var addthis_config = {"data_track_addressbar":false};</script>
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-50be16233e8b8adc"></script>
<script type="text/javascript">


$("#calendar-expand").click(function() {
  		if($(".secondary-nav").css('display') == 'none'){
	  		$("#calendar-expand").addClass("active");
  		}else{	
	  		$("#calendar-expand").removeClass("active");
  		}
  		$(".secondary-nav").toggle("slow");
  
});

</script>

</body>
</html>
