<%--This is currently the vertical page layout, horizontal is in a seperate .ss file--%>
<% include HeaderSmall %>


<div class="container" role="main">

	<div class="row d-flex ptop-30 justify-content-center">
		<div class="col-lg-12">
			
			 <h1>$Title</h1>

		</div>
	</div>
			 	
		<div class="row d-flex ptop-30">

			<div class="col-lg-4">

			 	<% if $Image.URL %>
			 		
			 		<% if $IsLateNight %>

			 		

				 	<img class="card__banner-img" alt="Late Night Programs Flag" role="presentation" src="$ThemeDir/dist/images/latenightbanner.png" />
				 	<% end_if %>
					<img class="d-block w-100 mb-2 lazyload" data-src="$Image.URL" alt="Poster for this event. Please read the event description for more information." data-aspectratio="$Image.Ratio" />
				<% else_if $Image.URL %>
					<img class="float-left p-2 d-sm-block d-lg-none w-50 mb-2 lazyload" data-src="$Image.URL" alt="Poster for this event. Please read the event description for more information." data-aspectratio="$Image.Ratio" />
				<% end_if %>

			</div>

			<div class="content col-lg-8"> $Content
				
			</div>
		</div>
		<!-- </div> /end row
			<div class="row">
				<div class="col-lg-5"></div>
				<div class="col-lg-8"></div> -->

		
		<div class="row d-flex ptop-30 justify-content-center">
			<div class="col-lg-12">
				<h2>Dates</h2>
			</div>
		</div>
		<div class="row d-flex ptop-30">
			
					<% if $Dates.Count > 1 %>
					
						<% loop $Dates.Limit(6) %>
						<div class="date-tile col-lg-2">

							<p><% include DateTimesList %></p>

							</div>
						<% end_loop %>

						<% loop $Dates.Limit(6,999) %>

						<% end_loop %>
					
				<% end_if %>
			
		</div>

		<div class="row d-flex ptop-30 justify-content-center">

			<div class="col-lg-4">
				<% with $Venue %>
					<% if $Address %>
					<div class="map-header">
						<h2> Location </h2>
					</div>
				</div>
			<div class="col-lg-8">

				<p class="venue-nav">
					<% with $Venue %>
						<% if $Address %>
							<a class="btn btn-secondary mt-2" target="_blank" href="$DirectionsLink">Get Directions<i class="fas fa-external-link-alt"></i></a>
						<% end_if %>
					<% end_with %>
					</p>
					</div>
				</div>


				<%-- This is broken--%>
			<div class="row d-flex ptop-30 justify-content-center">
				
				<div class="col-lg-12">
						<div class="map-container">
							<div id="mini-map" style="width: 100%; height: 100%" 

								data-link="$Link"
							 <% if $Latitude && $Longitude %> 
							 	data-lat="$Latitude" data-lng="$Longitude"  
							 	
							 	<% else %> 
							 	
							 	data-address="$Address" 
							 	
							 	<% end_if %> 

							 	data-title="$Title.LimitCharacters(20)">
							 	
							 </div>
					<% end_if %>
				<% end_with %>
				
				</div>
			</div>
		

	<div class="row d-flex ptop-30 justify-content-center">
		<div class="col-lg-12">
		

			<% include EventFooter %>



		</div>
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

			$Form
			$PageComments


