<% include HeaderSmall %>


<div class="container content-container " role="main" id="content">

	<div class="row d-flex <% if $Image.Orientation != "Wide" %>pt-4 pt-xl-5<% end_if %> justify-content-center">
		<div class="<% if $Image.Orientation == "Wide" %>col-lg-8 col-xl-7<% else_if not $Image.URL %>col-lg-8 col-xl-7<% else %>col-lg-6<% end_if %>">
			<article>

			 	<% if $Image.Orientation == "Wide" %>
			 		<% if $IsLateNight %>
				 		<img class="card__banner-img" alt="Late Night Programs Flag" role="presentation" src="$ThemeDir/dist/images/latenightbanner.png" />
				 	<% end_if %>
					<img class="d-block w-100 mb-2 lazyload" data-src="$Image.URL" alt="Poster for this event. Please read the event description for more information." data-aspectratio="$Image.Ratio" />
				<% else_if $Image.URL %>
					<img class="float-right p-2 d-sm-block d-lg-none w-50 mb-2 lazyload" data-src="$Image.URL" alt="Poster for this event. Please read the event description for more information." data-aspectratio="$Image.Ratio" />
				<% end_if %>

				<h1>$Title</h1>
                <div class="event-details">
				<% if $Dates || $Venue || $Location || $OnlineLocationUrl || $isOnline %>

					<p class="m-0"><% if $Dates.Count > 1 %><strong>Next date:</strong><% else %><strong>Date:</strong> <% end_if %>
						<% if $Dates %>
                        <i aria-hidden="true" class="far fa-calendar-alt"></i>
							<% loop $Dates.Limit(1) %>
								<% include DateTimesList %>
							<% end_loop %>
                             <% if $Dates.Count > 1 %><a href="{$Link}#all-dates" class="btn btn-outline-white btn-sm">More Dates</a><% end_if %>
							<br />
						<% else %>
								No upcoming dates. <br />
						<% end_if %>

                    </p>

                    <p>
                   <% if $isOnline %>
                    <strong>Location: </strong><i aria-hidden="true" class="fas fa-laptop"></i>Virtual Event<br />
                    <% else %>

    					<% if $Venue.Title || $Location %>
    					<strong> Location: </strong>
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
                <p>
                    <% if $OnlineLocationUrl || $MoreInfoLink %>

                        <% if $OnlineLocationUrl %>
                            <% if $OnlineLocationType == "Zoom" %>
                                    <a class="btn btn-primary btn-zoom mb-1" href="$OnlineLocationUrl" rel="noopener" target="_blank">Zoom link <i aria-hidden="true" class="fas fa-video"></i></a>
                            <% else %>
                                    <a class="btn btn-primary mb-1" href="$OnlineLocationUrl" rel="noopener" target="_blank">Virtual event link <i aria-hidden="true" class="fas fa-laptop-house"></i></a>
                            <% end_if %>
                        <% end_if %>
                        <% if $MoreInfoLink %>
                            <a href="$MoreInfoLink" class="btn btn-outline-primary mb-1" target="_blank">Event website <i aria-hidden="true" class="fas fa-external-link-alt"></i></a>
                        <% end_if %>
                    <% end_if %>

                </p>

                </div>
				<div class="content">$Content</div>
                <div class="event-details" id="all-dates">
				<% if $Dates.Count > 1 %>
					<h2>All dates for this event:</h2>
					<ul>
						<% loop $Dates %>
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
					<a href="$Link" class="btn btn-outline-white btn-sm mb-1">$Title</a>
					<% end_loop %></p>

				<% end_if %>
				<% if $Types %>
					<p>Categorized under:
					<% loop $Types %>
					<a href="$Link" class="btn btn-outline-white btn-sm mb-1">$Title</a>
					<% end_loop %></p>

				<% end_if %>
            </div>
				<% if $UiCalendarLink %>
					<p>
						<% if $UiCalendarLink %>
							<a href="$UiCalendarLink" class="btn btn-outline-white mb-2" target="_blank">View on the UI Events Calendar <i aria-hidden="true" class="fas fa-external-link-alt"></i></a>
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
				<p><i>Individuals with disabilities are encouraged to attend all University of Iowa–sponsored events.

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
        <% if $Image.URL  %>
		<% if $Image.Orientation != "Wide" || $Venue.Title || $Location %>
		<div class="col-lg-4">
			<div class="sticky-side">

			 	<% if $Image.URL && $Image.Orientation != "Wide" %>
					<% if $IsLateNight %>
				 		<img class="card__banner-img" alt="Late Night Programs Flag" role="presentation" src="$ThemeDir/dist/images/latenightbanner.png" />
				 	<% end_if %>
					<img class="d-none d-lg-block w-100 mb-2 lazyload" data-src="$Image.URL" alt="Poster for this event. Please read the event description for more information." data-aspectratio="$Image.Ratio" style="background-color: white;" />
				<% end_if %>
                <%--don't show location info for events that are only online --%>
                <% if not $isOnline %>
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
                    <% end_if %><%--end if not $isOnline --%>
			</div>
		</div>
		<% end_if %>
        <% end_if %>
	</div>

</div>

<% if $RelatedEvents %>
    <div class="related-container">
        <div class="container">
            <div class="row pt-4">
                <div class="col-lg-12">
                    <h2 class="text-center">Related Events</h2>
                    <div class="masonry-grid">
                        <% loop RelatedEvents %>
                            <% include EventCard %>
                        <% end_loop %> <%-- end loop Upcoming Events --%>
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
                        <% end_loop %> <%-- end loop Upcoming Events --%>
                    </div>
                </div>
            </div>
        </div>
    </div>
<% end_if %>
<% include InstaFeed %>
