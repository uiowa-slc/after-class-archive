<% include HeaderSmall %>


<div class="container" role="main">

	<div class="row ptop-30 justify-content-center">
		<div class="col-lg-8">
			<article>

				
				<div class = "p-2  w-50 mb-2 mr-auto ml-auto d-block">
					$SocialCardHTML("external")
				</div>
		

				<h1>$Title</h1>

				<% if $DateTimes || $Venue || $Location || $OnlineLocationUrl %>
				<p>
					<% if $DateTimes.Count > 1 %><strong>Next Date:</strong><% else_if $DateTimes.Count == 1 %><strong>Date:</strong> <% end_if %>
						<% if $DateTimes %>
							<% loop $DateTimes.Limit(1) %>
								<% include DateTimesList %>
							<% end_loop %>
							<br />
						<% else %>
								
						<% end_if %>

					<% if $OnlineLocationUrl %>
							<a class="btn btn-primary" href="$OnlineLocationUrl" rel="noopener" target="_blank">Online Meeting Link</a>
						<% end_if %>
					<% if $Venue.Title || $Location || $OnlineLocationUrl %>
					<br />
					<% if $Location %> 
					<strong> In Person Location: </strong>
						<span itemprop="location">
							<% if $Location %> $Location<% if $Venue.Title %>,<% end_if %> <% end_if %>
							<% if $Venue.Title %>
								<% with $Venue %>
									<% if $Link %>
										<a href="$Link">$Title</a>
									<% else %>
										$Title
									<% end_if %>
								<% end_with %>
							<% end_if %>
						</span>
					<% end_if %>
					<% end_if %>
				

						</p>
				<% end_if %>

				<%-- only show the caption on insta posts, twitter just includes the embed again --%>
				<% if $SocialType == "Instagram" %>
					<div class="content">
						<% if $Content %>
							$Content 
						<% else %>
							<p>$SocialCaption</p>
						<% end_if %>
					</div>
				<% end_if %>
				<% if $DateTimes.Count > 1 %>
					<h2>All dates for this event:</h2>
					<ul>
						<% loop $DateTimes %>
							<li><% include DateTimesList %></li>
						<% end_loop %>
					</ul>
				<% end_if %>

				<% if $Sponsor %>
						<p>Sponsored by: $Sponsor</strong></p>
				<% end_if %>
				<% if $Tags %>
					<p>Tagged as:
					<% loop $Tags %>
					<a href="$Link" class="btn btn-warning btn-sm mb-2">$Title</a>
					<% end_loop %></p>
			
				<% end_if %>
				<% if $Types %>
					<p>Categorized under:
					<% loop $Types %>
					<a href="$Link" class="btn btn-warning btn-sm mb-2">$Title</a>
					<% end_loop %></p>
			
				<% end_if %>

				<% if $MoreInfoLink || $UiCalendarLink || $SocialLink%>
					<p>
						<% if $MoreInfoLink %>
							<a href="$MoreInfoLink" class="btn btn-secondary mb-2" target="_blank" rel="noopener">Event Website <i aria-hidden="true" class="fas fa-external-link-alt"></i></a>
						<% end_if %>

						<% if $UiCalendarLink %>
								<a href="$UiCalendarLink" class="btn btn-secondary mb-2" target="_blank" rel="noopener">View on the UI events calendar <i aria-hidden="true" class="fas fa-external-link-alt"></i></a>
						<% end_if %>
						<% if $SocialLink %>
								<a href="$SocialLink" class="btn btn-secondary mb-2" target="_blank" rel="noopener"><i aria-hidden="true" class="fab fa-$SocialType.Lowercase"></i> View on $SocialType <i aria-hidden="true" class="fas fa-external-link-alt"></i></a>
						<% end_if %>
						<%-- <a class="btn btn-secondary" href="$CalendarLink">Add to your calendar <i aria-hidden="true" class="fas fa-calendar-alt"></i></a> --%>
					</p>
				<% end_if %>
			<% if $ContactEmail %>
			<hr />
			<p>Questions about this event?
				<% if $ContactName %>
					<a href="mailto:$ContactEmail" class="report-problem-link">Contact {$ContactName}.</a>
				<% else %>
					<a href="mailto:$ContactEmail" class="report-problem-link">Email {$ContactEmail}.</a>
				<% end_if %>
				</a>
			</p>
				<% if $IsLateNight %>
				<div class="late-night-feature">
					<p><img class="late-night-feature__flag" src="{$ThemeDir}/dist/images/latenightbanner.png" alt="Late Night Programs Flag" role="presentation"/>This event is part of Late Night Programs, <a href="events/interest/7491/">see more events tagged as Late Night Programs.</a></p>
					<p class="late-night-feature__smalltext"><a href="https://getinvolved.uiowa.edu/campus-programs/latenight" target="_blank">Learn more about Late Night Programs</a></p>
				</div>

				<% end_if %>
			<% end_if %>
				<p style="border-top: solid 1px #666; margin-top: 10px; padding-top: 10px;"><i>Individuals with disabilities are encouraged to attend all University of Iowa–sponsored events. 

				<% if $ContactName %>

					<% if $ContactPhone && $ContactEmail %>
						If you are a person with a disability who requires a reasonable accommodation in order to participate in this program, please contact {$ContactName} in advance at <a href="tel:{$ContactPhone}">{$ContactPhone}</a> or <a href="mailto:{$ContactEmail}">{$ContactEmail}</a>.
					<% else_if $ContactEmail %>
						If you are a person with a disability who requires a reasonable accommodation in order to participate in this program, please contact {$ContactName} in advance at <a href="mailto:{$ContactEmail}">{$ContactEmail}</a>.
					<% else_if $ContactPhone %>
						If you are a person with a disability who requires a reasonable accommodation in order to participate in this program, please contact {$ContactName} in advance at <a href="tel:{$ContactPhone}">{$ContactPhone}</a>.
					<% end_if %>
				<% else %>
						If you are a person with a disability who requires a reasonable accommodation in order to participate in this program, please contact the Office of the Vice President for Student Life in advance at <a href="tel:319-335-3557">319-335-3557</a> or <a href="mailto:vp-student-life@uiowa.edu">vp-student-life@uiowa.edu</a>.
				<% end_if %>
					
				</i>
					</p>		
			</article>
			$Form
			$PageComments
		</div>
		
		<%-- <div class="col-lg-4">
			<div class="sticky-side">

				<div class="d-none d-lg-block">
					<% if $IsLateNight %>
				 		<img class="card__banner-img" alt="Late Night Programs Flag" role="presentation" src="$ThemeDir/dist/images/latenightbanner.png" />
				 	<% end_if %>
				</div>
				<% with $Venue %>
					<% if $Address %>
						<div class="map-container">
							<div id="mini-map" style="width: 100%; height: 100%" data-link="$Link" <% if $Latitude && $Longitude %> data-lat="$Latitude" data-lng="$Longitude" <% else %> data-address="$Address" <% end_if %> data-title="$Title.LimitCharacters(20)"></div>
						</div>
					<% end_if %>
				<% end_with %>
				<p class="venue-nav mt-2">
					<% if $Venue.Title || $Location %>
						<strong>Location: </strong>
						<% if $Location %> $Location <% end_if %>
						<% if $Venue.Title %>
							<% with $Venue %>
								<% if $Link %>
									<a href="$Link" class="btn btn-warning btn-sm" itemprop="location">$Title</a>
								<% else %>
									$Title
								<% end_if %>
							<% end_with %>
						<% end_if %>
					<% end_if %>
				</p>
				<p class="venue-nav">
					<% with $Venue %>
						<% if $Address %>
							<a class="btn btn-secondary mt-2" target="_blank" href="$DirectionsLink">Get Directions <i aria-hidden="true" class="fas fa-external-link-alt"></i></a>
						<% end_if %>
					<% end_with %>
				</p>
			</div>
		</div> --%>
	
	</div>

</div>
<% with $Parent %>
	<section class="social-carousel__container">
		<h1 class="text-uppercase text-center" style="font-size: 22px; padding-top: 10px;">More From social media:</h1>
		<div class="social-carousel">
			<% loop $EventList %>
				<div class="carousel-cell">
					$SocialCardHTML("internal")
				</div>
			<% end_loop %>
		</div>
	</section>
<% end_with %>

<%-- <% if $RelatedEvents %>
	<div class="related-container">
		<div class="container">
			<div class="row pt-4">
				<div class="col-lg-12">
					<h2 class="text-center">Related Events</h2>
					<div class="masonry-grid">
						<% loop RelatedEvents %>
							<% include EventCard %>
						<% end_loop %> 
					</div>
				</div>
			</div>
		</div>
	</div>
<% else_if $LocationRelatedEvents %>
	<div class="related-container">
		<div class="container">
			<div class="row pt-4">
				<div class="col-lg-12">
					<h2 class="text-center">Events also located at {$Venue.Title}: </h2>
					<div class="masonry-grid">
						<% loop LocationRelatedEvents %>
							<% include EventCard %>
						<% end_loop %> 
					</div>
				</div>
			</div>
		</div>
	</div>
<% end_if %> --%>

