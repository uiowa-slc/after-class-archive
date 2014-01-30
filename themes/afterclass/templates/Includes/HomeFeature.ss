<% with/loopFeaturedEvents %>
	<% if First %>
	<% with/loopEvent %>
		
		<div class="homefeatureitem">
			<a href="$Link"><% if Image %><img src="$Image.LargeImage.URL" /><% else %><img src="$ThemeDir/images/placeholder.png" /><% end_if %></a>
			<div class="event_text">
				<h2>Featured Event <strong><a href="$Link">$Title</a></strong></h2>
				<p class="event_details">
				
            	<% with/loopDateAndTime %> 
		    			<a href="{$BaseHref}events/view/$StartDate.Format(Ymd)" class="date-link">
		    				<span>$StartDate.Format(M). $StartDate.DayOfMonth</span></a> 
		    				<% if StartTime %> at $StartTime.nice<% end_if %>
		    			
	    			
		    			<% if EndDate %> -
		    				<a href="{$BaseHref}events/view/$EndDate.Format(Ymd)" class="date-link">
		    			 		<span>$EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			 	</a>
		    			 	<% end_if %> 
		    			 <br />
		    			 
	    			<% end_with/loop%>   
        		</p>
        		<p>
        		at
        		<% with/loopVenues %>
        			$Title	
        		<% end_with/loop%><br />
        		<% if Cost %>
            	Admission: $Cost
            	<% end_if %>
            	
            	</p>
            	        <p class="event_description">$Content</p>

            	<% include EventCategoryList %>
			</div>
			
			<div class="event_date_tag">
			
					<% with/loopUpcomingDates %>
						<% if First %>
							<a href="{$BaseHref}events/view/$StartDate.Format(Ymd)" class="date-link"><div class="event_date_box">$StartDate.format(M) <strong>$StartDate.format(j)</strong> $StartDate.format(D)</div></a>
						<% end_if %>
		        	<% end_with/loop%>
	        
				<% include ShareLinks %>
        	</div>
        
		
		</div>
		
	<% end_with/loop%> <!-- end control event -->
	<% end_if %> <!-- end if first -->
<% end_with/loop%><!-- end control featured events -->