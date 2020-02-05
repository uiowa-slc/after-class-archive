			<% if $Sponsor %>
				<p>Sponsored by: $Sponsor</p>
				<% end_if %>
		
		<div class="row d-flex ptop-60 justify-content-center">
			<div class="col-md-12">
				<h3>Tags</h3>
			</div>
		</div>


		<div class="row d-flex justify-content-center">
			<div class="col-md-12">	
				<% if $Tags %>

					<% loop $Tags %>
					<a href="$Link" class="btn btn-warning btn-sm mb-2">$Title</a>
					<% end_loop %>
			
			</div>
		</div>

		<div class="row d-flex justify-content-center">
			<div class="col-md-12">

				<% if $Venue.Title %>
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
				<% end_if %>
			</div>
		</div>


		<div class="row d-flex ptop-30 justify-content-center">
			<div class="col-md-12">
				<h3>Categories</h3>
			</div>
		</div>


			<div class="row d-flex justify-content-center">
				<div class="col-md-12">
				<% if $Types %>
					
					<% loop $Types %>
					<a href="$Link" class="btn btn-warning btn-sm mb-2">$Title</a>
					<% end_loop %>
			
				<% end_if %>
				</div>
			</div>


			<div class="row d-flex ptop-30 justify-content-center">
				<div class="col-md-12">
				<% if $MoreInfoLink || $UiCalendarLink %>
					<p>
						<% if $MoreInfoLink %>
							<a href="$MoreInfoLink" class="btn btn-secondary mb-2" target="_blank">Event Website <i class="fas fa-external-link-alt"></i></a>
						<% end_if %>

						<% if $UiCalendarLink %>
								<a href="$UiCalendarLink" class="btn btn-secondary mb-2" target="_blank">View on the UI events calendar <i class="fas fa-external-link-alt"></i></a>
						<% end_if %>
						<%-- <a class="btn btn-secondary" href="$CalendarLink">Add to your calendar <i class="fas fa-calendar-alt"></i></a> --%>
					</p>
				<% end_if %>

			</div>
		</div>
		
			<% if $ContactEmail %>
			<hr/>

	<div class="row d-flex ptop-30 justify-content-center">
		<div class="col-md-12">
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
					<%-- <p class="late-night-feature__smalltext"><a href="#">Learn more about Late Night Programs</a></p> --%>
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
			</i></p>

		</div>
	</div>