<!doctype html>
<html xmlns:fb="http://ogp.me/ns/fb#">
<head>
	<% base_tag %>
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
<% if $ImageURL %>
      <div class="hero-event-image-container hide-for-medium-up" style="background-image: url('<% if $ImageURL %>$ImageURL<% else %>{$ThemeDir}/images/placeholder.png<% end_if %>')">
            <a href="$Link" class="img-shadow">
      
            </a>
            <div class="clear"></div>
          </div>
<% end_if %>
<div id="page_content" class="{$ClassName} <% if action %>$action<% end_if %>">
  <div class="container clearfix">
    $Layout
   </div>
</div>
<% include Footer %>

<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?libraries=geometry&sensor=false&key=AIzaSyB6ZQYL6TQGH7SLLvJRM9pQwOk5G6glKLE"></script>
<%-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<%-- <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script> --%>
<script src="{$ThemeDir}/build/build.src.js"></script>
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
</body>
</html>
