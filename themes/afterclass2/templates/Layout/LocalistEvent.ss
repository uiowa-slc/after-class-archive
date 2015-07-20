
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
						</div><!-- end single-event-when -->
								<% include AddThis %>
						</div>
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
							<div>

<%-- 
							<ul class="accordion" data-accordion>
							  <li class="accordion-navigation">
							    <a href="#panel1a">Accordion 1</a>
							    <div id="panel1a" class="content active">
							      Panel 1. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
							    </div>
							  </li>
							</ul> --%>
							<% if $Dates.Count > 1 %>
								<h2 id="all-dates">All Dates</h2>
									<% loop $Dates.Limit(3) %>
										<% include DateTimesList %>
										<br>														
									<% end_loop %>
								<% if $Dates.Count > 3 %>
									<ul class="accordion" data-accordion role="tablist">
										<li class="accordion-navigation">
										  <a href="#panel1a" role="tab" id="panel1d-heading" aria-controls="panel1d">View More Dates</a>
											<div id="panel1a" class="content" role="tabpanel" aria-labelledby="panel1d-heading">
												<% loop $Dates.Limit(1000,3) %>
													<% include DateTimesList %>
														<br>														
												<% end_loop %>
								    		</div>
										</li>
									</ul>
								<% end_if %>
							<% end_if %>
							
							

						</div>

					</div><!-- end single-event-text-->
					<% include EventSidebar %>
				</div><!-- end single-event-details -->
				<% if $RelatedEvents %>
				<hr />
					<% include RelatedEvents %>
				<% end_if %>
			</div><!-- end single-event-content-->
		</div><!-- end single-event -->

	</div><!-- end large-12 columns -->

</div><!-- end row -->
