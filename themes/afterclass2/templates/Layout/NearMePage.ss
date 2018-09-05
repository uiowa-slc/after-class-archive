<%--DON'T CHANGE IDs or Class Names in this page, otherwise nearby.js will break)--%>
<div class="row">
  <div class="large-8 columns map-content">

    <!-- map dom space -->
    <p id="status"></p>
    <div class="map-container">
    </div>

    <% with $Calendar %>

      <div class="map-jumplist">
        <% if $ActiveVenueList %>
        <p>See events at:
          <% loop $ActiveVenueList %>
              <a href = "#{$ID}" class="button tag">$Title.LimitCharacters(20)</a>
          <% end_loop %>
        </p>
        <% else %>
          <p>There aren't any events near you right now.</p>
        <% end_if %>
      </div>

      <div id="venuesWithEvents" >
      <% loop $ActiveVenueList %>
        <div class="event-card-list venue large" id="$ID" data-link="$Link" <% if $Latitude && $Longitude %> data-lat="$Latitude" data-lng="$Longitude" <% else %> data-address="$Address" <% end_if %> data-title="$Title.LimitCharacters(40)">    
          <h2>$Title</h2>
            <% loop $Events %>
              <div data-title="$Title.limitCharacters(33)" data-link="$Link" data-image="$Image.URL" data-cost="$Cost" <% loop $Dates %> <% with $StartDateTime %> data-startdate="$Format(l), $Format(F) $Format(j)" data-starttime="$Format(g):$Format(i) $Format(A)" <% end_with %> <% end_loop %> "> 
                <% include EventCard %> 
              </div>  
            <% end_loop %>
        </div>
        <div class="clear"></div>
      <% end_loop %>
      </div>
      
    <% end_with %>

  </div>

  <div class="large-4 columns">
    <% include SecondaryNav %>
  </div>  
  
</div>