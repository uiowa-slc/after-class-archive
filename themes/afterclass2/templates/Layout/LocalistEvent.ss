
<div class="row main-content">
	<div class="hero-event-image-container hide-for-medium-up" style="background-image: url('$Image.URL')"></div>
	<div class="medium-8 columns" id="left-column">
		<div class="hero-event single" itemscope itemtype="http://data-vocabulary.org/Event">

			<div class="hero-event-image-container show-for-medium-up" style="background-image: url('$Image.URL')">
				<div class="clear"></div>
			</div><!-- end hero-event-image-container -->

			<div class="hero-event-content">
				<h1><span itemprop="summary">$Title</span></h1>

				<div class="hero-event-details">
					<div class="hero-event-text">
						<p>
							<% include HeroDateTimes %>
						</p>
							<li><a href="$CalendarLink" title="Save to iCal" target="_blank" download>Add this to calendar</a></li>

						<p> <strong> Location: </strong>
							<% if $Venue.Title || $Location %>
								<% if $Location %> $Location <% end_if %>
								<% if $Venue.Title %>
									<% with $Venue %>
										<% if $Link %>
											@ <a href="$Link" class="button tag">$Title</a>
										<% else %>
											@ $Title
										<% end_if %>
									<% end_with %>
								<% end_if %>
							<% end_if %>
						</p>
						<% if $Cost %>
		            		<p><strong>Price:</strong> $Cost</p>
		            	<% end_if %>
					    <% if $CancelReason %>
							<p><strong>Note: $CancelReason</strong></p>
						<% end_if %>
						<% if $FacebookEventLink %>
							<p><a href="$ParsedFacebookEventLink" class="fbButton" target="_blank">View Facebook Event</a></p>
						<% end_if %>
						<hr>
						<div id="truncontent">
							$Content
							<a id="truncswitch" class="button">Read More +</a>
						</div>


						<% if $MoreInfoLink || $LocalistLink %>
							<p>
								<% if $MoreInfoLink %>
									<a href="$MoreInfoLink" class="button" target="_blank">Event Website</a>
								<% end_if %>
								<% if $LocalistLink %>
									<a href="$LocalistLink" class="button" target="_blank">View On events.uiowa.edu</a>
								<% end_if %>
							</p>
						<% end_if %>
						<% include AddThis %>
					</div><!-- end hero-event-text-->

					<div class="hero-event-when">
					<% if $Dates.Count > 1 %>
						<h2>All Dates</h2>
							<ul>
							<% loop $Dates %>
								<li class="$FirstLast">
									<% include DateTimesList %>
								</li>
							<% end_loop %>
							</ul>
					<% end_if %>
					</div><!-- end hero-event-when -->


				</div><!-- end hero-event-details -->
				<% if $RelatedEvents %>
				<hr />
					<% include RelatedEvents %>
				<% end_if %>
			</div><!-- end hero-event-content-->
		</div><!-- end hero-event -->

	</div><!-- end medium-8 columns -->

	<div class="medium-4 columns sidebar-sticky-content">
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
			<hr />
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
</div><!-- end row -->
