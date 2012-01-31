
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
		<li><h2><a href="$Link">$Title</a><% if Address %> <span><a href="#" target="_blank">Get Directions</a></span><% end_if %></h2>
		<% if Information %><p>$Information</p><% end_if %>
		<% if LinkURL %><p><a href="$LinkURL" target="_blank">Visit website</a></p><% end_if %>
		
		<!--<% control Events(2) %><div><% control Event %>$Title<% end_control %></div><% end_control %>-->
		<ul class="category-list-events">
			<% control Events(4) %><li>
			<% control Event %>
			<img src="$Image.SmallImage.URL">
			<div class="info">
			<strong>$Title</strong><br />
			<% end_control %>
			$StartDate.format(M j)<% if EndDate %> - $EndDate.format(M j)<% end_if %>
			</div>
			</li><% end_control %>
		</ul>
		<div class="view-all"><a href="Link">View All</a></div>
		</li>
	<% end_control %>
</ul>
<style type="text/css">
.category-list ul {
	margin: 0px;
	padding: 0px;
}
.category-list ul li {
	border: 0px solid #CFCFCF;
	list-style-type: none;
	float: left;
	margin: 0px 15px 20px 0px;
	padding: 0px;
	width: 280px;
}
.category-list ul li img {
	float: left;
}
.category-list ul li .info {
	font-size: 11px;
	margin: 0px 0px 0px 150px;
}
.category-list ul li .info strong {
	color: #555;
	font-size: 14px;
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