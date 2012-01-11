<header id="secondary_header">
	
	<h1>$Title</h1>
	
	<div class="events">
	<% control Events %>
		<div class="event">
			<% control Event %>
				<div class="event-image"><a href="$Link">
					<% if Image %>
						<img src="$Image.SmallImage.URL" alt="$Title" />
					<% else %>
						<img src="$BaseHref/themes/afterclass/images/placeholder_small.png" alt="Event Image">
					<% end_if %>
				</a></div>
			<% end_control %>
				<div class="event-description">
					<a href="$Link">
						<% control Event %>
							<p>$Title <% if Location %>- $Location <% end_if %><% if Cost %>($Cost)<% end_if %></p>
						<% end_control %>
						<p>$StartDate.format(M j), $StartDate.format(Y)<% if StartTime %> @ $StartTime.nice<% end_if %></p>
					</a>
				</div>
				<div class="clear"></div>
		</div>
		<% end_control %>
	</div>
</header>