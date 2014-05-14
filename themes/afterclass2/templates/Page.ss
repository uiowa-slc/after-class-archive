<!doctype html>
<head>
	<% base_tag %>
	<link href='{$ThemeDir}/css/master.css' rel='stylesheet' type='text/css'>
	<% include MetaTags %>
	<meta name="viewport" content="initial-scale = 1.0,maximum-scale = 1.0" />
</head>
<body>
<% include DivisionBar %>
<a href="{$BaseHref}feedback" class="fancybox.iframe" id="feedback-link"><img src="{$ThemeDir}/images/feedback.png" /></a>
<header id="page_header">
	<div class="row">
		<div class="large-12">
			<div class="big_header"><a href="$BaseHref"><img src="{$ThemeDir}/images/afterclass_logo.png" alt = "AfterClass Logo"/></a></div>
		    <p class="subheader">the best of ui's culture, events, and nightlife</p>
		</div>
	</div>
</header>
<% include Nav %>
<div id="page_content" class="{$ClassName} <% if action %>$action<% end_if %>">
	<div class="container clearfix">
	$Layout
   </div>
</div>
<% include Footer %>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="{$ThemeDir}/build/build.js"></script>
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
