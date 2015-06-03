
<div class="row main-content">
	<div class="single-event-image-container hide-for-medium-up" style="background-image: url('$Image.URL')"></div>
	<div class="large-12 columns" id="left-column">
		<div class="single-event single" itemscope itemtype="http://data-vocabulary.org/Event">

			<div class="single-event-image-container show-for-medium-up b-lazy" data-src="$Image.URL" style="background-image: url(<% include EventPlaceHolderSrc %>)">
				<div class="clear"></div>
			</div><!-- end single-event-image-container -->

			<div class="single-event-content">
				<h1><span itemprop="summary">$Title</span></h1>

				<div class="single-event-details">
					<div class="single-event-text">
						<p>
							<% include HeroDateTimes %>
							<% if $Dates.Count > 1 %><a href="#all-dates" class="button">More Dates</a><% end_if %>
							<% if $Venue.Title || $Location %>
							<br />
								<strong>Location: </strong> <% if $Location %>{$Location}<% end_if %>
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
					
						<% if $Cost %>
		            		<br /><strong>Price:</strong> $Cost
		            	<% end_if %>
					    <% if $CancelReason %>
							<br /><strong>Note: $CancelReason</strong>
						<% end_if %>
						<% if $FacebookEventLink %>
							<br /><a href="$ParsedFacebookEventLink" class="fbButton" target="_blank">View Facebook Event</a>
						<% end_if %>
						</p>
						<hr>
						<div class="row">
							<div class="large-8 columns end">
								$Content
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
							<div class="single-event-when">
							<% if $Dates.Count > 1 %>
								<h2 id="all-dates">All Dates</h2>
									<ul>
									<% loop $Dates %>
										<li class="$FirstLast">
											<% include DateTimesList %>
										</li>
									<% end_loop %>
									</ul>
							<% end_if %>
							</div><!-- end single-event-when -->
								<% include AddThis %>
							</div>
							<% include EventSidebar %>

						</div>

					</div><!-- end single-event-text-->

				</div><!-- end single-event-details -->
				<% if $RelatedEvents %>
				<hr />
					<% include RelatedEvents %>
				<% end_if %>
			</div><!-- end single-event-content-->
		</div><!-- end single-event -->

	</div><!-- end large-12 columns -->

</div><!-- end row -->
