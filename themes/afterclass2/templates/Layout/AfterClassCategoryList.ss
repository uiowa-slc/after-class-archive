
<header id="secondary_header">
	<% if Action = category %>
		<h1>Categories</h1>
	<% else_if Action = venue %>
		<h1>Venues</h1>
	<% else_if Action = sponsor %>
		<h1>Event Sponsors</h1>
	<% end_if %>
</header>
<ul class="category-list">
	<% control Category %>
	
	<% if Events %>
	
		<li><h2><a href="$Link">$Title</a><% if Address %> <span><a href="#" target="_blank">Get Directions</a></span><% end_if %></h2>
		<% if Information %><p>$Information</p><% end_if %>
		<% if LinkURL %><p><a href="$LinkURL">Visit their website</a></p><% end_if %>
		
		
		<!--<% control Events(2) %><div><% control Event %>$Title<% end_control %></div><% end_control %>-->
		<% if Events %>
		<ul class="category-list-events">
			<% control Events %><li>
			<% control Event %>
			<a href="$Link"><img src="$Image.SmallImage.URL"></a>
			<div class="info">
			<a href="$Link"><strong>$Title</strong></a><br />
			<% end_control %>
			$StartDate.format(M j)<% if EndDate %> - $EndDate.format(M j)<% end_if %>
			</div>
			</li><% end_control %>
		</ul>
		<!--<div class="view-all"><a href="{$BaseHref}events/categories/$Title">View All $Events.count Events</a></div>-->

			 <!--<a href="{$BaseHref}events/categories/$Title">View all $Events.count events</a>.-->
		<% else %>
			No events currently listed.
		<% end_if %>
		</li>
		<% end_if %> <%-- end if there are any events --%>
	<% end_control %>
</ul>
<style type="text/css">
.category-list>li{
	width: 100%;
}
.category-list ul {
	margin: 0px;
	padding: 0px;
}
.category-list ul li {
	border: 1px solid #ccc;
	list-style-type: none;
	float: left;
	margin: 0px 15px 20px 0px;
	padding: 10px;
	width: 450px;
	min-height: 150px;
}
.category-list ul li img {
	float: right;
	border: 1px solid #ccc;
}
.category-list ul li .info {
}
.category-list ul li .info strong {
	color: #2488A3;
	font-family: 'Doppio One', monospace;
	font-size: 22px;
	font-weight: normal;
	text-transform: capitalize;
	padding-bottom: 10px;
	border-bottom: 1px solid #ccc;
	margin-bottom: 10px;
	display: block;
	width: 300px;
	
}
.category-list .view-all {
	clear: left;
	float: right;
	font-size: 12px;
	color: #555;
}
.category-list h2 span a {
	font-family: 'Open Sans', sans-serif;
	font-size: 13px;
	font-weight: normal;
}
</style>