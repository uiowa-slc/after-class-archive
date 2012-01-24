<!DOCTYPE html>
<html lang="$ContentLocale">
 <head>
	<% base_tag %>
	<title>$Title</title>
	$MetaTags(false)
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0">
	<%-- Caution: Any Requirements calls in init() methods of custom page types won't work due to jQuery Mobile loading pages via Ajax, place them all in Page_Controller --%>
	<% require themedCSS(layout) %> 
	<% require themedCSS(typography) %> 

	<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
	<script src="{$ThemeDir}/js/jquery.mobile-1.0.min.js"></script>
	

	
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
</body>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
