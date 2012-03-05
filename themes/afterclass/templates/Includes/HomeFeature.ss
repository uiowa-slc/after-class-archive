<% control FeaturedEvents %>
	<% if First %>
	<% control Event %>
		
		<div class="homefeatureitem">
			<a href="$Link"><% if Image %><img src="$Image.LargeImage.URL" /><% else %><img src="$ThemeDir/images/placeholder.png" /><% end_if %></a>
			<div class="event_text">
				<h2>Featured Event <strong><a href="$Link">$Title</a></strong></h2>
				<p class="event_details">
				
            	<% control DateAndTime %> 
		    			<a href="{$BaseHref}events/view/$StartDate.Format(Ymd)" class="date-link">
		    				<span>$StartDate.Format(M). $StartDate.DayOfMonth</span></a> 
		    				<% if StartTime %> at $StartTime.nice<% end_if %>
		    			
	    			
		    			<% if EndDate %> -
		    				<a href="{$BaseHref}events/view/$EndDate.Format(Ymd)" class="date-link">
		    			 		<span>$EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			 	</a>
		    			 	<% end_if %> 
		    			 <br />
		    			 
	    			<% end_control %>   
        		</p>
        		<p>
        		at
        		<% control Venues %>
        			$Title	
        		<% end_control %><br />
        		<% if Cost %>
            	Admission: $Cost
            	<% end_if %>
            	
            	</p>
            	        <p class="event_description">$Content</p>

            	<% include EventCategoryList %>
			</div>
			
			<div class="event_date_tag">
			
					<% control UpcomingDates %>
						<% if First %>
							<a href="{$BaseHref}events/view/$StartDate.Format(Ymd)" class="date-link"><div class="event_date_box">$StartDate.format(M) <strong>$StartDate.format(j)</strong> $StartDate.format(D)</div></a>
						<% end_if %>
		        	<% end_control %>
	        
				<% include ShareLinks %>
        	</div>
        
		
		</div>
		
	<% end_control %> <!-- end control event -->
	<% end_if %> <!-- end if first -->
<% end_control %><!-- end control featured events -->