<div class="large-4 columns sidebar-sticky-content">
		<% if $Venue.Title || $Location %>
			<div id="detail_event_description_map">
				<div class="location-info">
					<p><% if $Location %>{$Location} <% end_if %>
					<% if $Venue.Title %>
							<% with $Venue %>
									<% if $Link %>@ <a href="$Link" class="button tag">$Title</a>
									<% else %>
										@ $Title
									<% end_if %>
								</p>
							<div class="clear"></div>
							<% if $Address %>
								<div class="map-container">
									<div id="mini-map" style="width: 100%; height: 100%" data-link="$Link" <% if $Latitude && $Longitude %> data-lat="$Latitude" data-lng="$Longitude" <% else %> data-address="$Address" <% end_if %> data-title="$Title.LimitCharacters(20)"></div>
								</div>
							<% end_if %>
							<p class="venue-nav">
							<% if $Address %>
								<a class="button get-directions" href="$DirectionsLink" target="_blank">Get Directions</a>
							<% end_if %>
							<% if $WebsiteURL %>
								<a class="button" href="$WebsiteURL">Venue website</a>
							<% end_if %>
							<% if $Link %>
								<a href="$Link" class="button">More events here</a>
							<% end_if %>
							</p>
						<% end_with %><%-- end_with $Venue --%>
					<% end_if %><%-- end_if $Venue --%>
				</div>
			</div> <!-- end detail_event_description_map -->
		<% end_if %>

		<%-- Sponsor Themed Area --%>
			<% if $Sponsor %>
				<div class="sponsors">
					<p><strong>Sponsored by: $Sponsor</strong></p>
				</div>
			<% end_if %>
			<% if $Tags %>
				<div class="categories">
					<p><strong>Tagged as:</strong>
					<% loop $Tags %>
					<a href="$Link" class="button tag">$Title</a>
					<% end_loop %></p>
				</div>
			<% end_if %>
			<% if $Types %>
				<div class="categories">
					<p><strong>Categorized under:</strong>
					<% loop $Types %>
					<a href="$Link" class="button tag">$Title</a>
					<% end_loop %></p>
				</div>
			<% end_if %>
			<% if $ContactEmail %>
			<p>Questions about this event?
				<% if $ContactName %>
					<a href="mailto:$ContactEmail" class="report-problem-link">Contact $ContactName</a>
				<% else %>
					<a href="mailto:$ContactEmail" class="report-problem-link">Email $ContactEmail</a>
				<% end_if %>
				</a>
			</p>
			<% end_if %>
	</div><!-- end medium-4 columns-->