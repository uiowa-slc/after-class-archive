<header id="secondary_header">
	
	<h1>$Title</h1>
	
	<div class="events">
	<% control Events %>
		<div class="event $EvenOdd $FirstLast">
			<% control Event %>
				<div class="event-image" onclick="$Link';><a href="$Link">
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
							<h2>$Title</h2>
							
							<% if Cost %>
								<p>($Cost)</p>
							<% end_if %>
							
						<% if Venues %>
							<% control Venues %>
								<a href="http://www.google.com/maps?f=d&daddr=$Address">Get Directions</a>
							<% end_control %>
						<% end_if %>

		
						<% end_control %>
						<p>$StartDate.format(M j)<% if StartTime %> @ $StartTime.nice<% end_if %></p>
						
	
					</a>
				</div>
				<div class="clear"></div>
		</div>
		<% end_control %>
	</div>
</header>