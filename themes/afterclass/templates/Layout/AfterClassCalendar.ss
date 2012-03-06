<section id="home_feature" class="feature $Action">

<% if action = view %>

<% else %>

	<% if FeaturedEvents %>
		<% include HomeFeature %>
	<% else %>
		<% include NextHomeFeature %>
	<% end_if %> <!-- end if featured events -->
<% end_if %> <!-- end if action = view -->
</section>
   
<section id="upcoming_events" class="$Action">
<header id="secondary_header">
<% if Action = view %>
		<h2>Events listed on $DateHeader</h2>
<% else %>
		<h2>What's Happening Next? </h2>
		        <p class="description"><!--Click on a date on our interactive calendar or scroll the list below for the latest event details.-->Scroll through our latest events below!</p>
<% end_if %>
</header>
	<% if Events %>
 
        <div id="upcoming_event_list">

        	<% control AllEvents %>
			<% control Event %>
        		<div class="event<% if ID = 0 %> hide<% else %><% end_if %>">
        		
        		<div class="upcoming-left-column">
	            	<a href="$Link"><% if Image %><img src="$Image.SmallImage.URL" width="130" height="110" alt="$Title" border="0" /><% else %><img src="$ThemeDir/images/placeholder_small.png" /><% end_if %></a>
            	</div>
            	<div class="event_text">
            		<h3><a href="$Link">$Title</a></h3>  
            		<p>
            	<% control DateAndTime %> 
		    			<a href="{$BaseHref}events/view/$StartDate.Format(Ymd)" class="date-link">
		    				<span>$StartDate.Format(M). $StartDate.DayOfMonth</span></a> 
		    				<% if StartTime %> at $StartTime.nice<% end_if %>
		    			
	    			
		    			<% if EndDate %> -
		    				<a href="{$BaseHref}events/view/$EndDate.Format(Ymd)" class="date-link">
		    			 		<span>$EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			 	</a>
		    			 	<% end_if %>
		    			 	</p>
		    		
		    			 
	    			<% end_control %>       	
            
		            <% end_control %>
		            	<p>
		    
		         
		                <% control Event %>
		               <% if Venues %> <% control Venues %>$Title<br/><% end_control %><% end_if %>
		                $Cost
		                <% end_control %> <!-- end control event -->
		                </p>
	           	</div>  
            	</div> 
            		<% if Pos == 5 %><span id="upcoming_scroll_indicator"> $Events.TotalItems &darr;</span>
<% end_if %>

            <% end_control %><!-- end control eventS -->
        </div>
	<% else %>
		No events currently listed.
	<% end_if %>

</section>