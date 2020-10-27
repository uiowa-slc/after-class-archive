<!doctype html>
<html lang="en" class="no-js">
  <head>
    <% base_tag %>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
<%--     $MetaTags(false) --%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <% if $URLSegment = 'home' %>
      <title>$SiteConfig.Title | The University of Iowa</title>
    <% else %>
      <title>$Title - $SiteConfig.Title | The University of Iowa</title>
    <% end_if %>
    <% include OpenGraph %>
    <!-- Disable tap highlight on IE -->
    <% include Favicons %>
    <meta name="twitter:widgets:theme" content="dark">
    <meta name="twitter:widgets:border-color" content="#000000">

    $GoogleFonts
    <link rel="stylesheet" href="{$ThemeDir}/dist/styles/main.css">
  </head>
  <body class="{$ClassName}">

    <% include UiowaBar %>

      $Layout


    <% include Footer %>


    <script>window.twttr = (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0],
        t = window.twttr || {};
      if (d.getElementById(id)) return t;
      js = d.createElement(s);
      js.id = id;
      js.src = "https://platform.twitter.com/widgets.js";
      fjs.parentNode.insertBefore(js, fjs);

      t._e = [];
      t.ready = function(f) {
        t._e.push(f);
      };

      return t;
    }(document, "script", "twitter-wjs"));</script>

    <%-- $BetterNavigator --%>
    <script type="text/javascript" src="//maps.googleapis.com/maps/api/js?libraries=geometry&key=AIzaSyDrwOxlXCSTCf6WWywio2KZfZkbpmya5X8"></script>


    <script src="{$ThemeDir}/dist/scripts/main.min.js"></script>

    $Analytics
  </body>
</html>
