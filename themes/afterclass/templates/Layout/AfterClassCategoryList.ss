
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
		<li><h2><a href="$Link">$Title</a></h2>
		<% if Information %><p>$Information</p><% end_if %>
		<% if LinkURL %><p><a href="$LinkURL" target="_blank">Visit website</a></p><% end_if %>
		<% if Address %><p><a href="#" target="_blank">Get Directions</a></p><% end_if %>
		<!--<% control Events(2) %><div><% control Event %>$Title<% end_control %></div><% end_control %>-->
		<ul class="category-list-events">
			<% control Events %><li>
			<% control Event %>
			<img src="$Image.SmallImage.URL">
			<div class="info">
			$Title
			</div>
			<% end_control %>
			</li><% end_control %>
		</ul>
		</li>
	<% end_control %>
</ul>
