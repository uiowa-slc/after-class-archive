<% control Events %>
	<% if First %>
	<% control Event %>
		<div class="homefeatureitem">
			<a href="$Link"><% if Image %><img src="$Image.LargeImage.URL" /><% else %><img src="$ThemeDir/images/placeholder.png" /><% end_if %></a>
			<div class="event_text">
				<h2>Featured Event <strong><a href="$Link">$Title</a></strong></h2>
				<div class="event_details">
				
				<% control DateAndTime %>
				<p>
						<a href="{$BaseHref}events/view/$StartDate.Format(Ymd)" class="date-link">
							$StartDate.format(l), $StartDate.format(M). $StartDate.format(j)
						</a> 
						<% if EndDate %> - 
							<a href="{$BaseHref}events/view/$EndDate.Format(Ymd)" class="date-link">
								$EndDate.format(l), $EndDate.format(M). $EndDate.format(j)
							</a>
						<% end_if %>
						<% if StartTime %>
						at $StartTime.Nice
						<% end_if %>
		        </p>	
        		<% end_control %>
        		<p>
        		at
        		<% control Venues %>
        			$Title	
        		<% end_control %></p>
        		<% if Cost %>
            	<p>Admission: $Cost</p>
            	<% end_if %>
            	</div>
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