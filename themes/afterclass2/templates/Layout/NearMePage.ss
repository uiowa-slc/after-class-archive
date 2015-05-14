<%--DON'T CHANGE IDs or Class Names in this page, otherwise nearby.js will break)--%>
<div class="row">
  <div class="large-12 columns map-content">

    <!-- map dom space -->
    
    <div class="map-container">
    </div>
    
    <% with $Calendar %>

      <div class="map-jumplist">
        <p id="status"></p>
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

          <ul class="event-card-list large">
            <% loop $Events %>
              <li><% include EventCard %></li>
            <% end_loop %>
          </ul> 
          
        </div>
        <div class="clear"></div>
      <% end_loop %>
      </div>
      
    <% end_with %>

  </div> 
  
</div>