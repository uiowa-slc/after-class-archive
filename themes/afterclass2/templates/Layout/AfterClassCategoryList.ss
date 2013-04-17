
<header id="secondary_header">
	<% control Category %><% if First %>
	<% if ClassName = Sponsor %>
	<h1>Event Sponsors</h1>
	<% else_if ClassName = Venue %>
	<h1>Venues</h1>
	<% else %>
	<h1>Categories</h1>
	<% end_if %>
	<% end_if %><% end_control %>
</header>

	<% control Category %>
		<div class="category">
			<% if Events %>
		<h2><a href="$Link">$Title &raquo;</a><% if Address %> <span><a href="#" target="_blank">Get Directions</a></span><% end_if %></h2>
				<% if Information %><p>$Information</p><% end_if %>
				<% if LinkURL %><p><a href="$LinkURL">Visit their website</a></p><% end_if %>
				<% if Events %>
				<% control Events %>
						<% control Event %>
							<% include EventCard %>	
						<% end_control %>
				<% end_control %>
				<% else %>
					No events currently listed.
				<% end_if %>
		
				<% end_if %> <%-- end if there are any events --%>
				<div class="clear"></div>				
		</div>
	<% end_control %>

<style type="text/css">
</style>