<section id="home_feature" class="feature $Action">

<% if action = view %>

<% else %>

	<% if FeaturedEvents %>
	<% control FeaturedEvents %>
	<% if First %>
	<% control Event %>
		
		<div class="homefeatureitem">
			<a href="$Link"><% if Image %><img src="$Image.LargeImage.URL" /><% else %><img src="$ThemeDir/images/placeholder.png" /><% end_if %></a>
			<div class="event_text">
				<h2>Featured Event <strong><a href="$Link">$Title</a></strong></h2>
				<p class="event_details">
				<% control UpcomingDates %>
				<% if First %>
				
				<a href="{$BaseHref}events/view/$StartDate.Format(Ymd)">$StartDate.format(D), $StartDate.format(M) $StartDate.format(j)</a> <% if EndDate %> - <a href="{$BaseHref}events/view/$EndDate.Format(Ymd)">$EndDate.format(D), $EndDate.format(M) $EndDate.format(d)</a><% end_if %><br/>
        		$StartTime.nice<br/>
        		<% end_if %>
        		<% end_control %>
            	$Location<br/>
            	$Cost</p>
            	<% include EventCategoryList %>
			</div>
			
			<div class="event_date_tag">
			
					<% control UpcomingDates %>
						<% if First %>
							<a href="{$BaseHref}events/view/$StartDate.Format(Ymd)"><div class="event_date_box">$StartDate.format(M) <strong>$StartDate.format(j)</strong> $StartDate.format(D)</div></a>
						<% end_if %>
		        	<% end_control %>
	        
	        	
	            <ul>
	            	<li class="share_facebook"><a href="#">Facebook</a></li>
	                <li class="share_rss"><a href="#">RSS</a></li>
	                <li class="share_twitter"><a href="#">Twitter</a></li>
	                <li class="share_email"><a href="#">Email</a></li>
	            </ul>
        	</div>
        
        <p class="event_description">$Content</p>
		
		</div>
		
	<% end_control %>
	<% end_if %>
	<% end_control %>
	<% else %>
	<div class="homefeatureitem">
		<a href="$Link"><img src="{$BaseHref}assets/book.png?r=42253" /></a>
		<div class="event_text">
			<h2>Study Break <strong>Nothing big today.</strong></h2>
				
		</div>
	</div>
	<% end_if %>
</section>
<% end_if %>    
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

        	<% control Events %>
			<% control Event %>
        		<div class="event">
            	<a href="$Link"><% if Image %><img src="$Image.SmallImage.URL" width="130" height="110" alt="$Title" border="0" /><% else %><img src="$ThemeDir/images/placeholder_small.png" /><% end_if %></a>
            	<div class="event_text">
            		<h3><a href="$Link">$Title</a></h3>         	
            
		            <% end_control %>
		            	<p>
		                <a href="{$BaseHref}events/view/$StartDate.Format(Ymd)">$StartDate.format(M j)</a>  
		                
		                <% if EndDate %>- <a href="{$BaseHref}events/view/$EndDate.Format(Ymd)">$EndDate.format(M j)</a><% end_if %> <br/>
		                $StartDate.format(l) <% if StartTime %>@ $StartTime.nice <% end_if %><br />
		                <% control Event %>
		               <% if Venues %> <% control Venues %>$Title<br/><% end_control %><% end_if %>
		                $Cost
		                <% end_control %> <!-- end control event -->
		                </p>
	           	</div>  
            	</div> 
            		<% if Pos == 5 %><span id="upcoming_scroll_indicator"> $Events.TotalItems &darr;</span>
<% end_if %>

            <% end_control %><!-- end control eventS %>
        </div>
	<% else %>
		No events currently listed.
	<% end_if %>

</section>