<section id="detail_feature" class="feature clearfix">

   			<% if Image %>
    	   		<img src="$Image.LargeImage.URL" class="detail_feature_image"/>
    	   	<% else %>
    	   		<img src="$ThemeDir/images/placeholder.png" class="detail_feature_image placeholder" />
    	   	<% end_if %>
            
    	   	<div class="event_group">
    	   
    	   	<div class="event_text">
    		<h2><strong>$Title</strong></h2>
    		
    		
    		
    		
    		<div class="event_details">

    	   	 		
    			<div id="dates">
    			
	    			<ul>
		    			<% control DateAndTime %> 
		    				<li>
				    			<a href="{$BaseHref}events/view/$StartDate.Format(Ymd)" class="date-link">
				    				<span>$StartDate.Format(D). $StartDate.Format(M). $StartDate.DayOfMonth</span>
				    			</a> 
				    				<% if StartTime %> at $StartTime.nice<% end_if %>
				    			
			    			
				    			<% if EndDate %> -
				    				<a href="{$BaseHref}events/view/$EndDate.Format(Ymd)" class="date-link">
				    			 		<span>$EndDate.Format(D). $EndDate.Format(M). $EndDate.DayOfMonth</span>
				    			 	</a>
				    			<% end_if %> 
			    			</li>
	
		    			<% end_control %> <%-- end control DateAndTime --%>
		    		</ul>
    			</div><!-- end dates -->
    		<% if Location %>
    		<p>$Location</p>
    		<% end_if %>
    			
    			<% if Venues %>
    			<ul class="venues">
	    			<% control Venues %>
	    				<li> at <a href="$Link">$Title</a> -
	    				<% if Address %> <a href="http://www.google.com/maps?f=d&daddr=$Address">Get Directions</a><% end_if %><% if WebsiteURL %>, <a href="$WebsiteURL">Visit Website</a><% end_if %>
	    				
	    				</li>
	    			<% end_control %>
    			</ul>
    			<% end_if %>
    			<% if Sponsors %>
    				<div class="sponsors">
	    			<p>Sponsored by</p>
	    			<ul>
		    			<% control Sponsors %>
		    				<li><a href="$Link">$Title</a></li>
		    			<% end_control %>
	    			</ul>
	    		</div>
            	<% end_if %>
            	$Cost
            		<% if CancelReason %>
	<p><strong>Note: $CancelReason</strong></p>
	<% end_if %>
	</div>

	
	<div class="event-meta">
       	<% include EventCategoryList %>
	</div>
	<div style="clear: both"></div>

</div> 
		<div style="clear: both"></div>

       	</div>
	
          	<div style="clear: both"></div>
             <% include ShareLinks %>
        				

    </section>


<section id="detail_event_description">
	
	<div id="detail_event_description_info">
	$Content
	
	<% if MoreInfoLink %>
	<p><a href="$MoreInfoLink" class="event-detail-button" target="_blank">More information</a></p>
	<% end_if %>
	<!--<p><a href="{$BaseHref}feedback/" class="report-problem-link fancybox.iframe">Report a problem with this event.</a></p>-->
	
	</div>
	</div>

	
<div style="clear: left;" class="clear"></div>

</section>


<% include RelatedEvents %>


