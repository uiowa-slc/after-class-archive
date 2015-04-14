<!doctype html>
<html xmlns:fb="http://ogp.me/ns/fb#">
<head>
	<% base_tag %>
<style><%-- include CriticalCss --%></style>
	<link rel="stylesheet" type="text/css" href="{$ThemeDir}/css/master.css" />
	<% include OpenGraph %>
    <title>$Title | 
  After Class: the best source for University of Iowa events &amp; Iowa City events, culture, nightlife, and more!</title>
	<meta name="viewport" content="initial-scale = 1.0,maximum-scale = 1.0" />
</head>
<body class="{$ClassName}">
<% include DivisionBarFoundation %>
<%--<a href="{$BaseHref}feedback" class="fancybox.iframe" id="feedback-link"><img src="{$ThemeDir}/images/feedback.png" /></a>--%>
<% include Header %>

<div id="page_content" class="{$ClassName} <% if action %>$action<% end_if %>">
  <div class="container clearfix">
    $Layout
   </div>
</div>
<% include Footer %>


<script type="text/javascript">
function downloadJSAtOnload() {
var element = document.createElement("script");
element.src = "$ThemeDir/build/build.js";
document.body.appendChild(element);
}
if (window.addEventListener)
window.addEventListener("load", downloadJSAtOnload, false);
else if (window.attachEvent)
window.attachEvent("onload", downloadJSAtOnload);
else window.onload = downloadJSAtOnload;
</script>


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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script async type="text/javascript">var addthis_config = {"data_track_addressbar":false};</script>
<script async type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-50be16233e8b8adc"></script>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?libraries=geometry&sensor=false&key=AIzaSyB6ZQYL6TQGH7SLLvJRM9pQwOk5G6glKLE"></script>
</body>
</html>
