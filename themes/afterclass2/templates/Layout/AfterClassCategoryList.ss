
<header id="secondary_header">
	<% with/loopCategory %><% if First %>
	<% if ClassName = Sponsor %>
	<h1>Event Sponsors</h1>
	<% else_if ClassName = Venue %>
	<h1>Venues</h1>
	<% else %>
	<h1>Trending Categories</h1>
	<% end_if %>
	<% end_if %><% end_with/loop%>
</header>

<div id="category-list-content">
	<ul>
	<% with/loopCategory %><% if Events %><% if AltTitle %><li><a href="#$Title">$AltTitle</a></li><% else %><li><a href="#$Title">$Title</a></li><% end_if %> <% end_if %> <% end_with/loop%>
	</ul>
	<hr />
	<% with/loopCategory %>
		<div class="category">
			<% if Events %>
			

		<h2 id="$Title">
		<% if ClassName = Eventtype %>
		$Title
		<% else %>
		<% if AltTitle %> $AltTitle <a href="$Link">(more information)</a> <% else %> $Title <a href="$Link">(more information)</a> <% end_if %>
		<% end_if %>
		</h2>
				<% if Information %><p>$Information</p><% end_if %>
				<% if Address %><a href="#" target="_blank" class="button">Get Directions</a><% end_if %>
				<div class="clear"></div>
				<% if LinkURL %><p><a href="$LinkURL" class="button">Visit their website</a></p><% end_if %>
				<div class="clear"></div>
				<% if Events %>
				<% with/loopEvents %>
						<% with/loopEvent %>
							<% include EventCard %>	
						<% end_with/loop%>
				<% end_with/loop%>
				<% else %>
					No events currently listed.
				<% end_if %>
					<div class="clear"></div>
				
						<p class="clearfix"><a href="#" class="top-link">Back to top</a></p>	
				<% end_if %> <%-- end if there are any events --%>
				<div class="clear"></div>
				

		</div>
	<% end_with/loop%>
</div>