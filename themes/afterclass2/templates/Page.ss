<!doctype html>

<head>
	<% base_tag %>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,700italic,400,600,700' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Doppio+One' rel='stylesheet' type='text/css'>
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
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
	<meta name="ryan" content="yes" />
	<title><% if CategoryName %>$Category.Title
		<% control Category %>
		<% if ClassName = Sponsor %>
		- Event Sponsor
		<% else_if ClassName = Venue %>
		- Event Venue
		<% else_if ClassName = Category %>
		- Upcoming
		<% end_if %>
		<% end_control %>
	<% else %>
		<% control Category %><% if First %>
		<% if ClassName = Sponsor %>
		Event Sponsors
		<% else_if ClassName = Venue %>
		Venues
		<% else %>
		Categories
		<% end_if %>
		<% end_if %><% end_control %>
	<% end_if %>
	 - After Class: The Best of UI's Culture, Events and Nightlife</title>

	<% if Content %>
		<meta name="description" content="$Content.NoHTML">
		<% if Category.Information %>
		<meta name="keywords" content="$Category.Title, Iowa City Movies, Iowa City Concerts, Lectures, and Campus Events" />
		<% end_if %>
	<% else %>
		<% if CategoryName %>
			<% if Category.Information %>
				<meta name="description" content="$Category.Information" />
			<% else %>
				<meta name="description" content="Iowa City Movies, Iowa City Concerts, Lectures, and Campus Events" />
			<% end_if %>
			<meta name="keywords" content="$Category.Title, Iowa City Movies, Iowa City Concerts, Lectures, and Campus Events" />
		<% else %>
			<meta name="description" content="Iowa City Movies, Iowa City Concerts, Lectures, and Campus Events" />
			<meta name="keywords" content="Iowa City Movies, Iowa City Concerts, Lectures, and Campus Events" />
		<% end_if %>
	<% end_if %>
	<meta name="author" content="IMU Marketing &amp; Design">
	<meta name="viewport" content="width=device-width,initial-scale=1">

	<% require themedCSS(layout) %>
	<% if iswindows %>
	<% require themedCSS(windows) %>
	<% end_if %>
		<script src="{$ThemeDir}/js/modernizr-2.0.6.min.js"></script>

	<link href='{$ThemeDir}/js/fancybox/jquery.fancybox.css' rel='stylesheet' type='text/css'>
	<script src="{$ThemeDir}/js/jquery.min.js"></script>
	<script src="{$ThemeDir}/js/fancybox/jquery.fancybox.pack.js"></script>

<script>

jQuery(document).ready(function ($) {
 $('#feedback-link').fancybox({
 
 		padding: 0
 
 });
 $('.report-problem-link').fancybox({
 
 		padding: 0
 
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

<!--[if IE ]>
<style>
@font-face {
  font-family: 'SketchBlock-Bold';
  src: url("../fonts/1327B9_0.eot?#iefix") format("embedded-opentype"), url("../fonts/1327B9_0.woff") format("woff"), url("../fonts/1327B9_0.ttf") format("truetype"), url("../fonts/1327B9_0.svg#wf") format("svg");
  }
<![endif]-->

</style>

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

<!--<script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>-->


<% include StudentLifeBar %>
<a href="{$BaseHref}feedback" class="fancybox.iframe" id="feedback-link"><img src="{$ThemeDir}/images/feedback.png" /></a>
<header id="page_header">
	<div class="container">
		<div class="big_header"><a href="$BaseHref">After Class</a></div>
	    <p class="subheader">The best of <em>UI</em>'s culture, events, and nightlife</p>
	
	
	    
	</div>
</header>
<nav id="page_navigation">
<% cached %>
	<div class="container">
	<ul class="clearfix">

		<li class="first"><a href="{$BaseHref}"><strong>Home</strong></a></li>
		<li>
			<a href="events/categories/"><strong>Categories</strong></a>
			<ul>
				<% control getEventtypes %>
					<% if Showmenu %>
						<% if Events %>
							<li><a href="events/categories/$URLSlug">$Title ($Events.Count)</a></li>
						
						<% else %>
							<li class="no-events"><span>$Title (0)</span></li>
						<% end_if %>
					<% end_if %>
				<% end_control %>
			</ul>
		</li>
		<li>
			<a href="events/sponsors/"><strong>Sponsors</strong></a>
			<ul>
				<% control getSponsors %>
					<% if Showmenu %>
						<% if Events %>
							<li><a href="events/sponsors/$URLSlug">$Title ($Events.Count)</a></li>
						
						<% else %>
							<li class="no-events"><span>$Title (0)</span></li>
						<% end_if %>
					<% end_if %>
				<% end_control %>
			</ul>
		</li>
		<li>
			<a href="events/venues/"><strong>Venues</strong></a>
			<ul>
				<% control getVenues %>
					<% if Showmenu %>
						<% if Events %>
							<li><a href="events/venues/$URLSlug">$Title ($Events.Count)</a></li>
						
						<% else %>
							<li class="no-events"><span>$Title (0)</span></li>
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
				<a href="$Link"><strong>$MenuTitle</strong></a>
				
				<% if Children %>
					<ul>
						<% control Children %>
							<li><a href="$Link">$Title</a></li>
						
						<% end_control %>
					
					
					</ul>
				<% end_if %>
				
			</li>
			<% end_if %>
		<% end_control %>
		
		
		
    </ul>
    
    <% end_cached %>

    <div id="secondary-nav">
<!--<p><% control RandomNewEvent %>$Image.SetCroppedSize(30,30)<a href="$Link">$Title</a><span>$Content.LimitWordCount(5)</span><% end_control %></p>-->

	<form id="SearchForm_SearchForm" action="{$BaseHref}/events/SearchForm" method="get" enctype="application/x-www-form-urlencoded">
	<fieldset>
		<legend></legend>
		
			<div id="Search" class="field text  nolabel"><div class="middleColumn"><input type="text" class="text nolabel" id="SearchForm_SearchForm_Search" name="Search" placeholder="Search for an event" ></div></div>
		
		
			<input class="action " id="SearchForm_SearchForm_action_results" type="submit" name="action_results" value="Go" title="Go">
		
	</fieldset>
</form>
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
			Site designed by IMU Marketing + Design
			
			</p>
			
			
		</div>
		<ul>
			<li><a href="{$BaseHref}/events/category">Category</a></li>
			<li><a href="{$BaseHref}/events/sponsor">Sponsor</a></li>
			<li><a href="{$BaseHref}/events/venue">Venue</a></li>
			<li><a href="{$BaseHref}/events/">All Events</a></li>
			<li><a href="{$BaseHref}/add/">Submit an Event</a></li>
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

<script type="text/javascript">
	var fnames = new Array();
	var ftypes = new Array();
	fnames[0] = 'EMAIL';
	ftypes[0] = 'email';
	fnames[1] = 'FNAME';
	ftypes[1] = 'text';
	fnames[2] = 'LNAME';
	ftypes[2] = 'text';
	fnames[3] = 'STUDENT';
	ftypes[3] = 'radio';
	fnames[4] = 'MMERGE4';
	ftypes[4] = 'text';
	try {
		var jqueryLoaded = jQuery;
		jqueryLoaded = true;
	} catch (err) {
		var jqueryLoaded = false;
	}
	var head = document.getElementsByTagName('head')[0];
	if (!jqueryLoaded) {
		var script = document.createElement('script');
		script.type = 'text/javascript';
		script.src = 'http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js';
		head.appendChild(script);
		if (script.readyState && script.onload !== null) {
			script.onreadystatechange = function () {
				if (this.readyState == 'complete') mce_preload_check();
			}
		}
	}
	var script = document.createElement('script');
	script.type = 'text/javascript';
	script.src = 'http://downloads.mailchimp.com/js/jquery.form-n-validate.js';
	head.appendChild(script);
	var err_style = '';
	try {
		err_style = mc_custom_error_style;
	} catch (e) {
		err_style = 'margin: 1em 0 0 0; padding: 1em 0.5em 0.5em 0.5em; background: ERROR_BGCOLOR none repeat scroll 0% 0%; font-weight: bold; float: left; z-index: 1; width: 80%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial; color: ERROR_COLOR;';
	}
	var head = document.getElementsByTagName('head')[0];
	var style = document.createElement('style');
	style.type = 'text/css';
	if (style.styleSheet) {
		style.styleSheet.cssText = '.mce_inline_error {' + err_style + '}';
	} else {
		style.appendChild(document.createTextNode('.mce_inline_error {' + err_style + '}'));
	}
	head.appendChild(style);
	setTimeout('mce_preload_check();', 250);
	var mce_preload_checks = 0;
	
	function mce_preload_check() {
		if (mce_preload_checks > 40) return;
		mce_preload_checks++;
		try {
			var jqueryLoaded = jQuery;
		} catch (err) {
			setTimeout('mce_preload_check();', 250);
			return;
		}
		try {
			var validatorLoaded = jQuery("#fake-form").validate({});
		} catch (err) {
			setTimeout('mce_preload_check();', 250);
			return;
		}
		mce_init_form();
	}
	
	function mce_init_form() {
		jQuery(document).ready(function ($) {
			var options = {
				errorClass: 'mce_inline_error',
				errorElement: 'div',
				onkeyup: function () {},
				onfocusout: function () {},
				onblur: function () {}
			};
			var mce_validator = $("#mc-embedded-subscribe-form").validate(options);
			$("#mc-embedded-subscribe-form").unbind('submit'); //remove the validator so we can get into beforeSubmit on the ajaxform, which then calls the validator
			options = {
				url: 'http://uiowa.us2.list-manage.com/subscribe/post-json?u=c61b1cddac92babd42d7d628e&id=8e3635391c&c=?',
				type: 'GET',
				dataType: 'json',
				contentType: "application/json; charset=utf-8",
				beforeSubmit: function () {
					$('#mce_tmp_error_msg').remove();
					$('.datefield', '#mc_embed_signup').each(
	
					function () {
						var txt = 'filled';
						var fields = new Array();
						var i = 0;
						$(':text', this).each(
	
						function () {
							fields[i] = this;
							i++;
						});
						$(':hidden', this).each(
	
						function () {
							var bday = false;
							if (fields.length == 2) {
								bday = true;
								fields[2] = {
									'value': 1970
								}; //trick birthdays into having years
							}
							if (fields[0].value == 'MM' && fields[1].value == 'DD' && (fields[2].value == 'YYYY' || (bday && fields[2].value == 1970))) {
								this.value = '';
							} else if (fields[0].value == '' && fields[1].value == '' && (fields[2].value == '' || (bday && fields[2].value == 1970))) {
								this.value = '';
							} else {
								this.value = fields[0].value + '/' + fields[1].value + '/' + fields[2].value;
							}
						});
					});
					return mce_validator.form();
				},
				success: mce_success_cb
			};
			$('#mc-embedded-subscribe-form').ajaxForm(options);
		});
	}
	
	function mce_success_cb(resp) {
		$('#mce-success-response').hide();
		$('#mce-error-response').hide();
		if (resp.result == "success") {
			$('#mce-' + resp.result + '-response').show();
			$('#mce-' + resp.result + '-response').html(resp.msg);
			$('#mc-embedded-subscribe-form').each(function () {
				this.reset();
			});
		} else {
			var index = -1;
			var msg;
			try {
				var parts = resp.msg.split(' - ', 2);
				if (parts[1] == undefined) {
					msg = resp.msg;
				} else {
					i = parseInt(parts[0]);
					if (i.toString() == parts[0]) {
						index = parts[0];
						msg = parts[1];
					} else {
						index = -1;
						msg = resp.msg;
					}
				}
			} catch (e) {
				index = -1;
				msg = resp.msg;
			}
			try {
				if (index == -1) {
					$('#mce-' + resp.result + '-response').show();
					$('#mce-' + resp.result + '-response').html(msg);
				} else {
					err_id = 'mce_tmp_error_msg';
					html = '<div id="' + err_id + '" style="' + err_style + '"> ' + msg + '</div>';
					var input_id = '#mc_embed_signup';
					var f = $(input_id);
					if (ftypes[index] == 'address') {
						input_id = '#mce-' + fnames[index] + '-addr1';
						f = $(input_id).parent().parent().get(0);
					} else if (ftypes[index] == 'date') {
						input_id = '#mce-' + fnames[index] + '-month';
						f = $(input_id).parent().parent().get(0);
					} else {
						input_id = '#mce-' + fnames[index];
						f = $().parent(input_id).get(0);
					}
					if (f) {
						$(f).append(html);
						$(input_id).focus();
					} else {
						$('#mce-' + resp.result + '-response').show();
						$('#mce-' + resp.result + '-response').html(msg);
					}
				}
			} catch (e) {
				$('#mce-' + resp.result + '-response').show();
				$('#mce-' + resp.result + '-response').html(msg);
			}
		}
	}
</script>

<!--End mc_embed_signup-->
 

		
			<!--<div class="fb-like"data-href="http://facebook.com/uiowa.imu"  data-send="true" data-width="450" data-show-faces="true" data-colorscheme="dark"></div>-->

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


</body>
</html>