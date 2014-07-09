<div class="row">
<div class="feature-background-wrapper">
<div class="medium-8 columns">
	<div class="hero-event single" itemscope itemtype="http://data-vocabulary.org/Event">	
		<div class="hero-event-image-container">
		
				<% if ImageURL %>
					<img itemprop="photo" src="$ImageURL" />
				<% else %>
					<img itemprop="photo" src="$ThemeDir/images/placeholder.png" />
				<% end_if %>

			<div class="clear"></div>
		</div><!-- end hero-event-image-container -->	

		<div class="hero-event-content">
			<h1><span itemprop="summary">$Title</span></h1>	
					
			<div class="hero-event-details">
				<div class="hero-event-text">
					<p>
						<% include HeroDateTimes %>
					</p>
					<% if $Cost %>
	            		<p><strong>Price:</strong> $Cost</p>
	            	<% end_if %>
				    <% if $CancelReason %>
						<p><strong>Note: $CancelReason</strong></p>
					<% end_if %>
					<% if $FacebookEventLink %>
						<p><a href="$FacebookEventLink" class="fbButton" target="_blank">View Facebook Event</a></p>
					<% end_if %>
					<% include AddThis %>
					<div id="truncontent">
						$Content
						<% if $MoreInfoLink %>
						<p><a href="$MoreInfoLink" class="button" target="_blank">More information</a></p>						
						<% end_if %>
						<button id='truncswitch'>+</button>
					</div>
					
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
			<hr />
			<% if $RelatedEvents %>
				<% include RelatedEvents %>
			<% end_if %>
		</div><!-- end hero-event-content-->
	</div><!-- end hero-event -->

</div><!-- end medium-8 columns -->

<div class="medium-4 columns">
	<% if $Venue || $Location %>
		<div id="detail_event_description_map">	
			<% with $Venue %>
				<div class="location-info">
					<% if $Top.Location %><p>{$Top.Location}</p><% end_if %>
					<h2><a href="$Link" class="button tag">@ $Title</a></h2>
					<div class="clear"></div>								
					<% if $Address %>
						<div class="map-container"><div id="mini-map" style="width: 100%; height: 100%" data-link="$LocalistLinl" <% if $Latitude && $Longitude %> data-lat="$Latitude" data-lng="$Longitude" <% else %> data-address="$Address" <% end_if %> data-title="$Title.LimitCharacters(20)></div></div>
					<% end_if %>
					<p>
				</div>
				<% if $Address %>
					<a class="button get-directions" href="$DirectionsLink" target="_blank">Get Directions</a>
				<% end_if %>
				<% if $WebsiteURL %>
					<a class="button" href="$WebsiteURL">Venue website</a>
				<% end_if %>
				<% if $Events %>
					<a href="$Link" class="button">More events here</a>
				<% end_if %>
				</p>
			<% end_with %>
			
		</div> <!-- end detail_event_description_map -->
	<% end_if %>
	<div class="<% if $PrimarySponsor %>sponsor-$PrimarySponsor.ID<% end_if %>">
	<% if $PrimarySponsor && $PrimarySponsor.LogoImage %>
		<% with $PrimarySponsor %>
			<% if $LinkURL %>
				<a href="$LinkURL" target="_blank"><img src="$LogoImage.URL" alt="sponsor image for $Title" class="PrimarySponsorImg"/></a>
			<% else %>
				<img src="$LogoImage.URL" alt="sponsor image for $Title" class="PrimarySponsorImg"/>
			<% end_if %>

		<% end_with %>
	<% end_if %>

		<% if $Sponsors %>
			<div class="sponsors">
				<p><strong>Sponsored by:</strong><% loop $Sponsors %>
				<a href="$Link">$Title</a><% if not $Last %>, <% end_if %>
				<% end_loop %></p>
			</p>
			</div>
		<% end_if %>
		<% if $Tags %>
			<div class="categories">
					<p><strong>Tagged as:</strong>
					<% loop $Tags %>
					<a href="$Link" class="button tag">$Title</a>
					<% end_loop %></p>
				</p>
				</div>
		<% end_if %>
	<hr />
	<p><a href="{$BaseHref}feedback/" class="report-problem-link fancybox.iframe">Report a problem with this event</a></p>
	</div><!-- end sponsor-x -->

</div><!-- end medium-4 columns-->
</div><!-- end row -->
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyB6ZQYL6TQGH7SLLvJRM9pQwOk5G6glKLE&sensor=false"></script>


</div><!-- end hero-event -->
</div><!-- end row -->




