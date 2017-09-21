<!doctype html>
<html xmlns:fb="http://ogp.me/ns/fb#">
<head>
	<% base_tag %>
	<link rel="stylesheet" type="text/css" href="{$ThemeDir}/css/master.css" />
	<% include OpenGraph %>
  <% include TwitterCard %>
    <title>$Title | 
  After Class: the best source for University of Iowa events &amp; Iowa City events, culture, nightlife, and more!</title>
	<meta name="viewport" content="initial-scale = 1.0"/>
<script type="text/javascript" src="//use.typekit.net/mpp4cid.js"></script>
<script type="text/javascript">try{Typekit.load();}catch(e){}</script>
</head>
<body class="{$ClassName}">
<% include UiowaBar %>
<%--<a href="{$BaseHref}feedback" class="fancybox.iframe" id="feedback-link"><img src="{$ThemeDir}/images/feedback.png" /></a>--%>
<% include Header %>
<% if $ImageURL %>
      <div class="hero-event-image-container hide-for-medium-up" style="background-image: url('<% if $ImageURL %>$ImageURL<% else %>{$ThemeDir}/images/placeholder.png<% end_if %>')">
            <a href="$Link" class="img-shadow">
      
            </a>
            <div class="clear"></div>
          </div>
<% end_if %>
<div id="page_content" class="{$ClassName} <% if action %>$action<% end_if %>" role="main">
  <div class="container clearfix">
    $Layout
   </div>
</div>
<% include Footer %>

<script type="text/javascript" src="//maps.googleapis.com/maps/api/js?libraries=geometry&sensor=false&key=AIzaSyB6ZQYL6TQGH7SLLvJRM9pQwOk5G6glKLE"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="{$ThemeDir}/build/build.js"></script>
$Analytics
<script type="text/javascript">var addthis_config = {"data_track_addressbar":false};</script>
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-50be16233e8b8adc"></script>
</body>
</html>
