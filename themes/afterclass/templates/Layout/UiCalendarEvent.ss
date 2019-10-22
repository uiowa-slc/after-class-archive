<% include HeaderSmall %>


<div class="container ptop-30">
	<div class="row d-flex justify-content-center">
		<div class="col-lg-8" role="main">
			<article>

				<h1>$Title</h1>
				<% include EventCardDatesTimes %>
				<div class="content">$Content</div>
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

				<% if $MoreInfoLink || $UiCalendarLink %>
					<p>
						<% if $MoreInfoLink %>
							<a href="$MoreInfoLink" class="btn btn-secondary" target="_blank">Event Website <i class="fas fa-external-link-alt"></i></a>
						<% end_if %>
					<% if $UiCalendarLink %>
							<a href="$UiCalendarLink" class="btn btn-secondary" target="_blank">View on the UI events calendar <i class="fas fa-external-link-alt"></i></a>
						<% end_if %>
					</p>
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
				<p><i>Individuals with disabilities are encouraged to attend all University of Iowa–sponsored events. 

				<% if $ContactName %>

					<% if $ContactPhone && $ContactEmail %>
						If you are a person with a disability who requires a reasonable accommodation in order to participate in this program, please contact {$ContactName} in advance at {$ContactPhone} or {$ContactEmail}.
					<% else_if $ContactEmail %>
						If you are a person with a disability who requires a reasonable accommodation in order to participate in this program, please contact {$ContactName} in advance at {$ContactEmail}.
					<% else_if $ContactPhone %>
						If you are a person with a disability who requires a reasonable accommodation in order to participate in this program, please contact {$ContactName} in advance at {$ContactPhone}.
					<% end_if %>
				<% else %>
						If you are a person with a disability who requires a reasonable accommodation in order to participate in this program, please contact Bret Gothe in advance at bret-gothe@uiowa.edu.
				<% end_if %>
					
				</i>
					</p>		
			</article>
			$Form
			$PageComments
		</div>
		<div class="col-lg-4">
			<% if $Dates.First.StartDateTime.Format(H) > 20 %>
 		<img class="card__banner-img" src="$ThemeDir/dist/images/latenightbanner.png" />
 		<% end_if %>
			<img class="d-block w-100" src="$Image.URL" />
		</div>
	</div>

</div>

