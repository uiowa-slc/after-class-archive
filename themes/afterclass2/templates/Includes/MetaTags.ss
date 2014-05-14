	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	
	<% if CategoryName %>
	<% loop Category %>
		<% if ClassName = Sponsor %>
		<link rel="canonical" href="{$BaseHref}events/sponsors/$URLSlug" />
		<% else_if ClassName = Venue %>
		<link rel="canonical" href="{$BaseHref}events/venues/$URLSlug" />
		<% else_if ClassName = Category %>
		<link rel="canonical" href="{$BaseHref}events/categories/$URLSlug" />
		<% end_if %>
	<% end_loop %>
	<% end_if %>
	
	<% if ClassName = AfterClassEvent %>
	<meta property="og:title" content="$Title"/>
	<meta property="og:type" content="activity"/>
	<meta property="og:image" content="$Image.LargeImage.AbsoluteURL"/>
	<meta property="og:url" content="$AbsoluteLink"/>
	<meta property="og:site_name" content="After Class"/>
	<meta property="og:app_id" content="242901859120617"/>
	<% end_if %>
	<title>$Title - 
	After Class: the best source for University of Iowa events &amp; Iowa City events, culture, nightlife, and more!</title>
	<% if Content %>
		<meta name="description" content="$Content.NoHTML">
		<% if Category.Information %>
		<meta name="keywords" content="$Category.Title, Iowa City Movies, Iowa City Events, Iowa City Concerts, Lectures, and Campus Events" />
		<% end_if %>
	<% else %>
		<% if CategoryName %>
			<% if Category.Information %>
				<meta name="description" content="<% loop Category %>$Information.XML<% end_loop %>" />
			<% else %>
				<meta name="description" content="After Class is the biggest list of University of Iowa events, culture, nightlife, concerts, lectures, and more." />
			<% end_if %>
			<meta name="keywords" content="$Category.Title, Iowa City Movies, Iowa City Events, Iowa City Concerts, Lectures, and Campus Events" />
		<% else %>
			<meta name="description" content="After Class is the biggest list of University of Iowa events, culture, nightlife, concerts, lectures, and more." />
			<meta name="keywords" content="Iowa City Movies, Iowa City Concerts, Lectures, and Campus Events" />
		<% end_if %>
	<% end_if %>
	<meta name="author" content="Student Life Marketing &amp; Design">
