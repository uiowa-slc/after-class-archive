<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?libraries=geometry&sensor=false"></script>
  <div class="row">
    <div class="large-8 columns map-content">
      <div class="map-container">
      </div>
      
        <div class="map-jumplist">
          <% if $PlaceList %>
          <p>See events at:
            <% loop $PlaceList.limit(11) %>
                <a href = "#{$ID}" class="button tag">$Title.LimitCharacters(20)</a>
            <% end_loop %>
          </p>
          <% else %>
            <p>There aren't any events near you right now.</p>
          <% end_if %>
        </div>
        <% loop $PlaceList %>
          <div class="event-card-list venue large" id="$ID" data-link="$Link" <% if $Latitude && $Longitude %> data-lat="$Latitude" data-lng="$Longitude" <% else %> data-address="$Address" <% end_if %> data-title="$Title.LimitCharacters(20)">    
            <h2>$Title</h2>
              <% loop Events %>
                <div data-title="$Title" data-link="$Link" data-image="$Image.URL" data-cancel="$CancelReason" data-cost="$Cost" <% if Sponsors %><% loop Sponsors %> data-sponsor="$Sponsors" <% end_loop %><% end_if %> 
                  <% loop $Dates %> 
                    data-startdate="$Format(l), $Format(F) $Format(j)" data-starttime="$Format(g):$Format(i) $Format(A)"
                  <% end_loop %> "> 
                <% include EventCard %> 
                </div>  
              <% end_loop %>
          </div>
          <div class="clear"></div>
        <% end_loop %>
    </div>

        <div class="large-4 columns">
          <% include SecondaryNav %>
        </div>  
</div>