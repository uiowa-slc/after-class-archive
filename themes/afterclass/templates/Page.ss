<!doctype html>
<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js ie7 oldie" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8 oldie" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
	<% base_tag %>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,700italic,400,600,700' rel='stylesheet' type='text/css'>
	
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title>$Title - After Class: The Best of UI's Culture, Concerts and Nightlife</title>
	<% if Content %>
		<meta name="description" content="$Content.NoHTML">
	<% else %>
		<meta name="description" content="Iowa City Movies, Iowa City Concerts, Lectures, and Campus Events">
	<% end_if %>	<meta name="author" content="IMU Marketing &amp; Design">

	<meta name="viewport" content="width=device-width,initial-scale=1">

	<% require themedCSS(layout) %>
	<% if iswindows %>
	<% require themedCSS(windows) %>
	<% end_if %>
	 
	<script src="{$ThemeDir}/js/jquery.min.js"></script>
	<script src="{$ThemeDir}/js/modernizr-2.0.6.min.js"></script>
	
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
  js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1&appId=242901859120617";
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
<header id="page_header">
	<div class="container">
		<div class="big_header"><a href="$BaseHref">After Class</a></div>
	    <p class="subheader">The best of <em>UI</em>'s culture, events, and nightlife</p>
	    
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
			<a href="events/category/"><strong>Categories</strong><span>The type of event</span></a>
			<ul>
				<% control getEventtypes %>
					<% if Showmenu %>
					<% if Events %>
					<li><a href="events/categories/$Title">$Title</a></li>
					<% end_if %>
					<% end_if %>
				<% end_control %>
			</ul>
		</li>
		<li>
			<a href="events/sponsor/"><strong>Sponsors</strong><span>Who puts it on</span></a>
			<ul>
				<% control getSponsors %>
					<% if Showmenu %>
					<% if Events %>

					<li><a href="events/categories/$Title">$Title</a></li>
					<% end_if %>
					<% end_if %>
				<% end_control %>
			</ul>
		</li>
		<li>
			<a href="events/venue/"><strong>Venues</strong><span>Where it takes place</span></a>
			<ul>
				<% control getVenues %>
					<% if Showmenu %>
					<% if Events %>

					<li><a href="events/categories/$Title">$Title</a></li>
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
				<a href="$Link"><strong>$MenuTitle</strong> $Title</a>
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
	
		<div id="dsl-info">
			<div id="logo-container">
				<a href="http://www.uiowa.edu" class="uiowa-logo"> <img src="{$ThemeDir}/images/ui_logo.png" alt="The University of Iowa Logo" /></a> 
				<a href="http://studentlife.uiowa.edu/"><img src="{$ThemeDir}/images/dsl_logo.png" alt="The University of Iowa Logo" /></a>  
			</div>
			<p>319-335-3117<br />
			<a href="mailto:uiafterclass@gmail.com">uiafterclass@gmail.com</a><br />
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

var fnames = new Array();var ftypes = new Array();fnames[0]='EMAIL';ftypes[0]='email';fnames[1]='FNAME';ftypes[1]='text';fnames[2]='LNAME';ftypes[2]='text';fnames[3]='STUDENT';ftypes[3]='radio';fnames[4]='MMERGE4';ftypes[4]='text';

try {

var jqueryLoaded=jQuery;

jqueryLoaded=true;

} catch(err) {

var jqueryLoaded=false;

}

var head= document.getElementsByTagName('head')[0];

if (!jqueryLoaded) {

var script = document.createElement('script');

script.type = 'text/javascript';

script.src = 'http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js';

head.appendChild(script);

if (script.readyState && script.onload!==null){

script.onreadystatechange= function () {

if (this.readyState == 'complete') mce_preload_check();

}

}

}

var script = document.createElement('script');

script.type = 'text/javascript';

script.src = 'http://downloads.mailchimp.com/js/jquery.form-n-validate.js';

head.appendChild(script);

var err_style = '';

try{

err_style = mc_custom_error_style;

} catch(e){

err_style = 'margin: 1em 0 0 0; padding: 1em 0.5em 0.5em 0.5em; background: ERROR_BGCOLOR none repeat scroll 0% 0%; font-weight: bold; float: left; z-index: 1; width: 80%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial; color: ERROR_COLOR;';

}

var head= document.getElementsByTagName('head')[0];

var style= document.createElement('style');

style.type= 'text/css';

if (style.styleSheet) {

style.styleSheet.cssText = '.mce_inline_error {' + err_style + '}';

} else {

style.appendChild(document.createTextNode('.mce_inline_error {' + err_style + '}'));

}

head.appendChild(style);

setTimeout('mce_preload_check();', 250);



var mce_preload_checks = 0;

function mce_preload_check(){

if (mce_preload_checks>40) return;

mce_preload_checks++;

try {

var jqueryLoaded=jQuery;

} catch(err) {

setTimeout('mce_preload_check();', 250);

return;

}

try {

var validatorLoaded=jQuery("#fake-form").validate({});

} catch(err) {

setTimeout('mce_preload_check();', 250);

return;

}

mce_init_form();

}

function mce_init_form(){

jQuery(document).ready( function($) {

var options = { errorClass: 'mce_inline_error', errorElement: 'div', onkeyup: function(){}, onfocusout:function(){}, onblur:function(){} };

var mce_validator = $("#mc-embedded-subscribe-form").validate(options);

$("#mc-embedded-subscribe-form").unbind('submit');//remove the validator so we can get into beforeSubmit on the ajaxform, which then calls the validator

options = { url: 'http://uiowa.us2.list-manage.com/subscribe/post-json?u=c61b1cddac92babd42d7d628e&id=8e3635391c&c=?', type: 'GET', dataType: 'json', contentType: "application/json; charset=utf-8",

beforeSubmit: function(){

$('#mce_tmp_error_msg').remove();

$('.datefield','#mc_embed_signup').each(

function(){

var txt = 'filled';

var fields = new Array();

var i = 0;

$(':text', this).each(

function(){

fields[i] = this;

i++;

});

$(':hidden', this).each(

function(){

var bday = false;

if (fields.length == 2){

bday = true;

fields[2] = {'value':1970};//trick birthdays into having years

}

if ( fields[0].value=='MM' && fields[1].value=='DD' && (fields[2].value=='YYYY' || (bday && fields[2].value==1970) ) ){

this.value = '';

} else if ( fields[0].value=='' && fields[1].value=='' && (fields[2].value=='' || (bday && fields[2].value==1970) ) ){

this.value = '';

} else {

this.value = fields[0].value+'/'+fields[1].value+'/'+fields[2].value;

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

function mce_success_cb(resp){

$('#mce-success-response').hide();

$('#mce-error-response').hide();

if (resp.result=="success"){

$('#mce-'+resp.result+'-response').show();

$('#mce-'+resp.result+'-response').html(resp.msg);

$('#mc-embedded-subscribe-form').each(function(){

this.reset();

});

} else {

var index = -1;

var msg;

try {

var parts = resp.msg.split(' - ',2);

if (parts[1]==undefined){

msg = resp.msg;

} else {

i = parseInt(parts[0]);

if (i.toString() == parts[0]){

index = parts[0];

msg = parts[1];

} else {

index = -1;

msg = resp.msg;

}

}

} catch(e){

index = -1;

msg = resp.msg;

}

try{

if (index== -1){

$('#mce-'+resp.result+'-response').show();

$('#mce-'+resp.result+'-response').html(msg);

} else {

err_id = 'mce_tmp_error_msg';

html = '<div id="'+err_id+'" style="'+err_style+'"> '+msg+'</div>';



var input_id = '#mc_embed_signup';

var f = $(input_id);

if (ftypes[index]=='address'){

input_id = '#mce-'+fnames[index]+'-addr1';

f = $(input_id).parent().parent().get(0);

} else if (ftypes[index]=='date'){

input_id = '#mce-'+fnames[index]+'-month';

f = $(input_id).parent().parent().get(0);

} else {

input_id = '#mce-'+fnames[index];

f = $().parent(input_id).get(0);

}

if (f){

$(f).append(html);

$(input_id).focus();

} else {

$('#mce-'+resp.result+'-response').show();

$('#mce-'+resp.result+'-response').html(msg);

}

}

} catch(e){

$('#mce-'+resp.result+'-response').show();

$('#mce-'+resp.result+'-response').html(msg);

}

}

}



</script>

<!--End mc_embed_signup-->
 

		
			<div class="fb-like" data-send="true" data-width="450" data-show-faces="true" data-colorscheme="dark"></div>
			
			<a href="https://twitter.com/share" class="twitter-share-button" data-hashtags="AfterClass">Tweet</a>
			<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
			
			
			
			
		</div>
		
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

<!--[if lt IE 7 ]>
	<script src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.2/CFInstall.min.js"></script>
	<script>window.attachEvent("onload",function(){CFInstall.check({mode:"overlay"})})</script>
<![endif]-->

</body>
</html>
