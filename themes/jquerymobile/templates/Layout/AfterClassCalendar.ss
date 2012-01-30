<script>



</script>
<header id="secondary_header">
	
	<h1>$Title</h1>
	
	<div class="events">
	<% control Events %>
		<div class="event $EvenOdd $FirstLast" onClick="location.href='$Link'" >
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
							<h2>$Title</h2>
							
							<% if Cost %>
								<p>($Cost)</p>
							<% end_if %>
						<% end_control %>
						<p>$StartDate.format(m j)<% if StartTime %> @ $StartTime.nice<% end_if %></p>
						
					<% control Event %>
						<% if Venues %>
							<% control Venues %>
								<p>$Title <a href="http://www.google.com/maps?f=d&daddr=$Address" class="directions-link">Get Directions</a></p>
							<% end_control %>
						<% end_if %>
					<% end_control %>
						
	
					</a>
				</div>
				<div class="clear"></div>
		</div>
		<% end_control %>
	</div>
</header>