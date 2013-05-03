
<header id="secondary_header">
	<% control Category %><% if First %>
	<% if ClassName = Sponsor %>
	<h1>Event Sponsors</h1>
	<% else_if ClassName = Venue %>
	<h1>Venues</h1>
	<% else %>
	<h1>Trending Categories</h1>
	<% end_if %>
	<% end_if %><% end_control %>
</header>

<div id="single-page-content">
	<h2>Jump To</h2>
	<p><% control Category %><% if Events %><a href="#$Title">$Title</a>, <% end_if %> <% end_control %></p>
	<hr />
	<% control Category %>
		<div class="category">
			<% if Events %>
			

		<h2 id="$Title">
		<% if ClassName = Eventtype %>
		$Title
		<% else %>
		$Title <a href="$Link">(more information)</a>
		<% end_if %>
		</h2>
				<% if Information %><p>$Information</p><% end_if %>
				<% if Address %><a href="#" target="_blank" class="button">Get Directions</a><% end_if %>
				<div class="clear"></div>
				<% if LinkURL %><p><a href="$LinkURL">Visit their website</a></p><% end_if %>
				<% if Events %>
				<h3>Events in this category:</h3>
				<% control Events %>
						<% control Event %>
							<% include EventCard %>	
						<% end_control %>
				<% end_control %>
				<% else %>
					No events currently listed.
				<% end_if %>
					<div class="clear"></div>
				
						<p class="clearfix"><a href="#" class="top-link">Back to top</a></p>	
						<hr />
				<% end_if %> <%-- end if there are any events --%>
				<div class="clear"></div>
				

		</div>
	<% end_control %>
</div>