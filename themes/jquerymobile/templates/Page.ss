<!DOCTYPE html>
<html lang="$ContentLocale">
 <head>
	<% base_tag %>
	<title>$Title</title>
	
	<% if Content %>
		<meta name="description" content="$Content">
	<% else %>
		<meta name="description" content="Iowa City Movies, Iowa City Concerts, Lectures, and Campus Events">
	<% end_if %>
	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0">
	<%-- Caution: Any Requirements calls in init() methods of custom page types wont work due to jQuery Mobile loading pages via Ajax, place them all in Page_Controller --%>
	<% require themedCSS(layout) %> 
	<% require themedCSS(typography) %> 

	<script src="http://code.jquery.com/jquery-1.6.4.js"></script>
	
	<script language=javascript>
      $(document).bind("mobileinit", function () {
            $.mobile.ajaxLinksEnabled = false;
      });
</script>
	
	<script src="{$ThemeDir}/js/jquery.mobile-1.0.min.js"></script>
	
	<script>
	
	$(document).ready(function() {
		$(".event").click(function(){
	     window.location=$(this).find("a").attr("href");
	     return false;
		});
		
		
		$("#SearchForm_SearchForm_action_results").parent().hide();
		
		
	});

</script>
	
</head>
<body>
	<div data-role="page">
		<div data-role="header">
			<a href="{$BaseHref}/home/" data-role="button" 
				data-icon="home" data-iconpos="notext">
				Home
			</a>
			<h1>$SiteConfig.Title</h1>
			<%-- See Navigation_manypages.ss for handling more than half a dozen toplevel pages --%>
			<% include Navigation %>
		</div>
		<div data-role="content">
			$Layout
		</div>
		<div data-role="footer">
			<% include Footer %>
		</div>
	</div>
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
