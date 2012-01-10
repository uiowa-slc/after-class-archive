<header id="secondary_header">
		<!-- Category, Events, Event -->
			<h1><span>Listed under:</span> $Category.Title</h1>
</header>
		<% control Category %>
			<% if Events %>
				<% control Events %>
					<% if Featured %>
						<!-- If Featured -->
						<section id="secondary_feature" class="feature clearfix">
				    	   	<img src="$Image.LargeImage.URL" class="secondary_feature_image"/>
				    	   	<div class="event_group">
				    	   	<div class="event_text">
				    			<h2>Featured Event <strong>$Title</strong></h2>
				    			<p class="event_details">
				    			
				    			<% control UpcomingDates %>
								<% if First %>
								$StartDate.format(D), $StartDate.format(M) $StartDate.format(d)<br/>
				        		$StartTime.nice<br/>
				    			<% end_if %>
				    			<% end_control %>
				    			
				            	$Location<br/>
				            	$Cost</p>           
							</div>
				       	
				       		<div class="event_date_tag">
				       		
							<a href="#"><% control UpcomingDates %>
							<% if First %>
							<div class="event_date_box">$StartDate.format(M) <strong>$StartDate.format(d)</strong> $StartDate.format(D)</div></a>
							<% end_if %><!-- end if first -->
				        	<% end_control %></a>
				        	
				            <ul>
				            	<li class="share_facebook"><a href="#">Facebook</a></li>
				                <li class="share_rss"><a href="#">RSS</a></li>
				                <li class="share_twitter"><a href="#">Twitter</a></li>
				                <li class="share_email"><a href="#">Email</a></li>
				            </ul>
				        	</div>       
				        
				         	<p class="event_description">$Content</p>
				    
							</div>
				    	</section>		    	
			 		<% end_if %><!-- End If Featured -->
		    	<% end_control %><! -- end control events -->
		    <% else %>
		    
		    <div id="single-page-content">
		    <h2>There are no events currently listed here.</h2>
		    <p>Please check the <a href="$BaseHref">the homepage</a> or the following categories for what's happening currently: </p>
		    <ul>
		    	<li>Test</li>
		    	<li>Test</li>
		    </ul>
		    
		    </div>
		    
		    <% end_if %> <!-- end if events -->
		<% end_control %><!-- end control category -->
				
			<% control Category %>
				
				<% if Events %>
				<section id="secondary_event_list">
				<% control Events %>
					<div class="secondary_event">
					
							<div class="event_date_tag"><a href="$Link">
								<div class="event_date_box">$StartDate.format(M) <strong>$StartDate.format(j)</strong> $StartDate.format(D)</div>
							</a></div>
							
							<% control Event %>
								<a href="$Link">
								<% if Image %>
									<img src="$Image.MediumImage.URL"/>
								<% else %>
									<img src="$ThemeDir/images/placeholder_small.png" />
								<% end_if %>
							<h2><strong>$Title</strong> @ $Location</h2></a>
							<% end_control %><!-- end control events -->
						</div>
					<% end_control %>
				</section>

			<% end_if %><!-- end if events -->
	<% end_control %>
