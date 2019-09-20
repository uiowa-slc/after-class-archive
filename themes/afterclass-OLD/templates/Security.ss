<!doctype html>
<html xmlns:fb="http://ogp.me/ns/fb#">
<head>
    <% base_tag %>
    <link rel="stylesheet" type="text/css" href="{$ThemeDir}/css/main.css" />
    <% include OpenGraph %>
  <% include TwitterCard %>
    <title>$Title | 
  After Class: Student-focused events at the University of Iowa</title>
  <meta name="title" content="$Title">
  <meta name="description" content="$Content.ATT">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script type="text/javascript" src="//use.typekit.net/mpp4cid.js"></script>
<script type="text/javascript">try{Typekit.load();}catch(e){}</script>
</head>
<body class="{$ClassName}">
<% include UiowaBar %>
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


<div class="row">
    <div class="medium-8 columns">
        <header id="secondary_header">
            <h1>$Title</h1>
        </header>
        <div id="medium-4 columns">
            <div>
        <p>Continue to log in with your HawkID.</p>
        $Content
        $Form
   
            </div>
        </div>
    </div>
    <div class="medium-4 columns">
        <% include SideBar %>
    </div>
</div>


    
   </div>

</div>
<% include Footer %>

<script type="text/javascript" src="//maps.googleapis.com/maps/api/js?libraries=geometry&key=AIzaSyDrwOxlXCSTCf6WWywio2KZfZkbpmya5X8"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="{$ThemeDir}/build/app.js"></script>
$Analytics
<script type="text/javascript">var addthis_config = {"data_track_addressbar":false};</script>
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-50be16233e8b8adc"></script>
</body>
</html>


