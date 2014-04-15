<!doctype html>

<head>
	<% base_tag %>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,700italic,400,600,700' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Doppio+One' rel='stylesheet' type='text/css'>
	<!--<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />-->
	<% include MetaTags %>

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
<% include DivisionBar %>
<a href="{$BaseHref}feedback" class="fancybox.iframe" id="feedback-link"><img src="{$ThemeDir}/images/feedback.png" /></a>
<header id="page_header">
	<div class="container" id="canvas-container">
		<!--<canvas id="canvas"></canvas>-->
		<div class="big_header"><a href="$BaseHref"><img src="{$ThemeDir}/images/afterclass_logo.png" alt = "AfterClass Logo"/></a></div>
	    <p class="subheader">the best of ui's culture, events, and nightlife</p>
	</div>
</header>

<% include Nav %>

<!--cut out header and nav-->
<div id="page_content" class="{$ClassName} <% if action %>$action<% end_if %>">
	<div class="container clearfix">
	$Layout
	
    <div>
	
	</div>
	
   </div>
</div>
<% include Footer %>

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
</body>
</html>
