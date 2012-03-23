
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
			<a href="$Link"><img src="$Image.SmallImage.URL"></a>
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
.category-list>li{
	width: 100%;
}
.category-list ul {
	margin: 0px;
	padding: 0px;
}
.category-list ul li {
	border: 1px solid #ccc;
	list-style-type: none;
	float: left;
	margin: 0px 15px 20px 0px;
	padding: 10px;
	width: 450px;
	min-height: 180px;
	background: rgba(255, 255, 255, .3);

}
.category-list ul li img {
	float: right;
	border: 1px solid #ccc;
}
.category-list ul li .info {
}
.category-list ul li .info strong {
	/*color: #2488A3;*/
	font-family: 'Doppio One', monospace;
	font-size: 22px;
	font-weight: normal;
	text-transform: capitalize;
	padding-bottom: 10px;
	border-bottom: 1px solid #ccc;
	margin-bottom: 10px;
	display: block;
	width: 300px;
	
}

.category-list .where {
	margin: 0;
	margin-top: 5px;
	width: auto;

}

.category-list .where ul li{
	border: none;
	list-style-type: none;
	float: none;
	margin: 0;
	padding: 0;
	width: auto;
	min-height: 0;

}
.category-list .view-all {
	clear: left;
	float: right;
	font-size: 12px;
	color: #555;
}
.category-list h2 span a {
	font-family: 'Open Sans', sans-serif;
	font-size: 13px;
	font-weight: normal;
}
</style>