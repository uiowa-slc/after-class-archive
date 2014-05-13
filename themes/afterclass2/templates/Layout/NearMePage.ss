<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?libraries=geometry&sensor=false"></script>

  
  <div class="row">
    <div class="span12 map-content">
      <div class="map-container">
      </div>
      
      <div class="map-jumplist">
        <% if $ActiveVenues %>
        <p>See events at:
          <% loop $ActiveVenues %>
              <a href = "#{$ID}" class="button tag">$Title.LimitCharacters(20)</a>
          <% end_loop %>
        </p>
        <% else %>
          <p>We can't find any events you right now.</p>
        <% end_if %>

      </div>
      
    </div>
</div>


<div class='container-fluid' id='venuesWithEvents'>

<% loop $ActiveVenues %>
		<section class='event-card-list venue row-fluid' id='$ID' data-link='$Link' <% if $Lat && $Lng %> data-lat='$Lat' data-lng='$Lng' <% else %> data-address='$Address' <% end_if %> data-title='$Title.LimitCharacters(20)'>		
			<h2>$Title</h2>	
			<% loop Events.limit(8) %>
			<div data-title='$Title' data-link='$Link' data-image='$Image' data-cancel='$CancelReason' data-cost='$Cost' <% if Sponsors %><% loop Sponsors %> data-sponsor='$Sponsors' <% end_loop %><% end_if %> <% loop UpcomingDatesAndRanges %> data-startdate='$StartDate.Day(), $StartDate.Month() $StartDate.DayOfMonth()' data-starttime='$StartTime.Nice' <% end_loop %> >
			<% include EventCard %>	
			</div>	
			<% end_loop %>
		</section>
<% end_loop %>	

</div>
				
	