			<h1><span itemprop="summary">$Title</span></h1>	
			<div class="hero-event-image-container small-screen">
					<% if Image %>
						<% loop Image %>
							<% loop CroppedImage(235,151) %>
							<img itemprop="photo" src="$URL" />
							<% end_loop %>
						<% end_loop %>
					<% else %>
						<img itemprop="photo" src="$ThemeDir/images/placeholder.png" />
					<% end_if %>
				<div class="clear"></div>
			</div><!-- end hero-event-image-container small-screen -->
					
			<div class="hero-event-details">
				<div class="hero-event-text">
					<p>
						<% if UpcomingDatesAndRanges.Count > 1 %><strong>Next Date:</strong><% end_if %>
						<% loop UpcomingDatesAndRanges.First %>
							<% include HeroDateTimes %>
						<% end_loop %>
					</p>
					$Content
					<% if Cost %>
	            		<p><strong>Price:</strong> $Cost</p>
	            	<% end_if %>
				    <% if CancelReason %>
						<p><strong>Note: $CancelReason</strong></p>
					<% end_if %>
					<% if MoreInfoLink %>
						<p><a href="$MoreInfoLink" class="button" target="_blank">More information</a></p>
					<% end_if %>
					
				</div><!-- end hero-event-text-->