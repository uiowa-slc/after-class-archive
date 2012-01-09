

<% if Action = category %>
	<h1>Categories</h1>
<% else_if Action = venue %>
	<h1>Venues</h1>
<% else_if Action = sponsor %>
	<h1>Event Sponsors</h1>
<% end_if %>
<ul class="category-list">
	<% control Category %>
		<li><a href="$Link">$Title</a>
		<% if Linkurl %><a href="http://$LinkURL">$LinkURL</a><% end_if %>
		</li>
	<% end_control %>
</ul>
