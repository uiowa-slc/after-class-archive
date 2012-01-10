<header id="secondary_header">
	
	<h1>$Title</h1>
	
	<div class="events">
	<% control Events %>
		<div class="event">
			<% control Event %>
				<div class="event-image"><a href="$Link">
					<% if Image %>
					<% control Image %>
						<img src="$CroppedImage(100,100).URL" alt="$Title" />
						<% end_control %>
					<% else %>
						<!--div style="width: 100px;height: 100px; float:right; border: 1px solid #3F3F3F; margin: 0px 55px 10px 0px;"></div-->
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