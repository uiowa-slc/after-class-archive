<div class="row">
	<div class="medium-8 columns">
		<header id="secondary_header">

			<h1>$Action</h1>

		</header>

		<div id="category-list-content">
			
			<% loop Category %><% if Events %><% if AltTitle %><a href="#$Title" class="button tag">$AltTitle</a></li><% else %><a href="#$Title" class="button tag">$Title</a><% end_if %> <% end_if %> <% end_loop %>
			<% loop Category %>
			<% if Events %>
				<hr />
				<div class="category">
					
				<h2 id="$Title">
				<a href="$Link">
					<% if ClassName = Eventtype %>
					$Title
					<% else %>
						<% if AltTitle %>$AltTitle<% else %>$Title<% end_if %>
					<% end_if %>
				</a>
				</h2>
						<% if Information %><p>$Information</p><% end_if %>
						<p><a href="$Link" class="button">More Info</a>
						<% if Address %><a href="$DirectionsLink" target="_blank" class="button get-directions">Get Directions</a><% end_if %>
						<% if LinkURL %><a href="$LinkURL" class="button">Visit Website</a><% end_if %></p>
						<div class="clear"></div>
						<% if Events %>
						<% loop Events.Limit(3) %>
							<% include EventCard %>	
						<% end_loop %>
						<% else %>
							No events currently listed.
						<% end_if %>
						<div class="clear"></div>
						
						<div class="clear"></div>
						

				</div>
			<% end_if %> <%-- end if there are any events --%>
				
			<% end_loop %>
		</div>
	</div>
	<div class="medium-4 columns">
		<% include SideBar %>
	</div>
</div>
