
<header id="secondary_header">
	<% if Action = category %>
		<h1>Categories</h1>
	<% else_if Action = venue %>
		<h1>Venues</h1>
	<% else_if Action = sponsor %>
		<h1>Event Sponsors</h1>
	<% end_if %>
</header>
<ul class="category-list">
	<% control Category %>
	<% if Events %>
	
		<li><h2><a href="$Link">$Title</a><% if Address %> <span><a href="#" target="_blank">Get Directions</a></span><% end_if %></h2>
		<% if Information %><p>$Information</p><% end_if %>
		<% if LinkURL %><p><a href="$LinkURL">Visit their website</a></p><% end_if %>
		
		
		<!--<% control Events(2) %><div><% control Event %>$Title<% end_control %></div><% end_control %>-->
		<% if Events %>
		<ul class="category-list-events">
			<% control Events %><li>
			<% control Event %>
			<% if Image %><a href="$Link"><img src="$Image.SmallImage.URL"></a><% end_if %>
			<div class="info">
			<a href="$Link"><strong>$Title</strong></a><br />
			
				 <div id="dates">
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
    			</div>
    			
    			<div class="where">
				
					<% if Venues %>
						<ul>
						<% control Venues %>
							<li>@ <a href="$Link">$Title</a></li>
						<% end_control %>
						</ul>
					<% end_if %>
				</div>
				
						
    			
						<% end_control %>

			
			</div>
			</li>
			

			
			
			<% end_control %>
		</ul>
		<!--<div class="view-all"><a href="{$BaseHref}events/categories/$Title">View All $Events.count Events</a></div>-->

			 <!--<a href="{$BaseHref}events/categories/$Title">View all $Events.count events</a>.-->
		<% else %>
			No events currently listed.
		<% end_if %>
		</li>
		<% end_if %> <%-- end if there are any events --%>
	<% end_control %>
</ul>
<style type="text/css">
</style>