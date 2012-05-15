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
			<li><h2><a href="$Link">$Title</a><% if Address %> - <span><a href="#" target="_blank">Get Directions</a></span><% end_if %></h2>
			<p><% if Events %><a href="$Link">$Events.Count Event(s)</a><% else %>No events.<% end_if %></p>
			<% if Information %><p>$Information</p><% end_if %>
			<% if LinkURL %><p><a href="$LinkURL">Visit their website</a></p><% end_if %>
		<% else %>
			<!--<p>There aren't any events currently listed on After Class. Is there an event we missed? <a href="{$BaseHref}add">Submit one to us!</a></p>-->
		
		<% end_if %>
	
	<% end_control %>
</ul>
<style type="text/css">
</style>