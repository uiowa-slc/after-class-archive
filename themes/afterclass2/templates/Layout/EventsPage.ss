<section id="home_feature" class="feature">
<% control Page(all-events) %>
	<% control Children %>
	<% if Featured %>
		<div class="homefeatureitem">
			<a href="$Link"><img src="$Image.LargeImage.URL" /></a>
			<div class="event_text">
				<h2>Featured Event <strong>$Title</strong></h2>
				<p class="event_details">
				<% control UpcomingDates %>
				<% if First %>
				$StartDate.format(D), $StartDate.format(M) $StartDate.format(j)<br/>
        		$StartTime.nice<br/>
        		<% end_if %>
        		<% end_control %>
            	$Location<br/>
            	$Cost</p>
			</div>
			
			<div class="event_date_tag">
			<a href="#">
			<% control UpcomingDates %>
			<% if First %>
			<div class="event_date_box">$StartDate.format(M) <strong>$StartDate.format(j)</strong> $StartDate.format(D)</div>
			<% end_if %>
        	<% end_control %>
        	</a>
        	
            <ul>
            	<li class="share_facebook"><a href="#">Facebook</a></li>
                <li class="share_rss"><a href="#">RSS</a></li>
                <li class="share_twitter"><a href="#">Twitter</a></li>
                <li class="share_email"><a href="#">Email</a></li>
            </ul>
        	</div>
        
        <p class="event_description">$Content</p>
		
		</div>
	<% end_if %>
	<% end_control %>
<% end_control %>
</section>
    
    <section id="upcoming_events">
    	<!--<div id="upcoming_events_header">-->
    		<h2>Upcoming Events</h2>
        	<p class="description"><!--Click on a date on our interactive calendar or scroll the list below for the latest event details.-->Scroll the list below for the latest event details.</p>
        <!--</div>-->
        
        <!--<div id="calendar_widget">
        	<!-- Place calendar widget here -->
        <!--</div>-->
        
        <div id="upcoming_event_list">
        	<% control Page(all-events) %>
        	<% control Children %>
        		<div class="event">
            	<a href="$Link"><img src="$Image.SmallImage.URL" width="130" height="110" alt="$Title" border="0" /></a>
                <h3><a href="$Link">$Title</a></h3>
                
                <p>
                <% control UpcomingDates %>
				<% if First %>$StartDate.format(M j), $StartDate.format(Y)<br/>
                	$StartDate.format(l) @ $StartTime.nice<% end_if %>
                <% end_control %>
                in $Location<br/>
                $Cost
                </p>
                
            	</div>
            <% end_control %>
        	<% end_control %>
        </div>
    </section>