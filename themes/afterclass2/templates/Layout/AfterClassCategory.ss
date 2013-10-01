<header id="secondary_header">
 	<% if Category.AltTitle %>
 		<h1>$Category.AltTitle</h1>
 	<% else %> 
 		<h1> $Category.Title </h1>
 	<% end_if %> 
</header>
 <div id="category-content" class="category">
 			
 			<div class="about-category">
	 			<% control Category %>
				
				<div class="category-content">
					<% if Information %><p class="category-information">$Information</p><% end_if %>
					
				
					<% if Address %><p>
					<div class="clear"></div>

					<% if Phone %><p>$Phone</p><% end_if %>
					
					<% if Email %><a href="mailto: $Email">$Email</a></p><% end_if %>

	 				<% if LinkURL %><p><a class="button" href="$LinkURL" target="_blank">Visit Website &raquo; </a></p><% end_if %>
	 				<% if WebsiteURL %><p><a class="button" href="$WebsiteURL" target="_blank">Visit the $Title Website &raquo;</a></p>
	 				<a class="button" href="http://www.google.com/maps?f=d&daddr=$Address">Get Directions &raquo; </a></p><% end_if %>
	 				<% end_if %>
	 				
	 			<div class="clear"></div>
	 			</div><!-- end category-content -->
	 			
	 			<div class="clear"></div>
 			</div><!-- end about-category -->

		
		
	
		<% if ClassName = Sponsor %>
 			<h2>Current events sponsored by $Title:</h2>
 		<% else_if ClassName = Venue %>
 		
 			<style>
 				.where {
 					display: none;
 				
 				}
 			
 			</style>
 		<% else_if ClassName = Eventtype %>
 			
 		<% end_if %>	
		
		

		<div class="category-list">
		<% if Events %>
			<% control Events %>
				<div class="event-cards">
				<% control Event %>
					<% include EventCard %>
				<% end_control %>
				</div>
			<% end_control %>
		<div style="clear: both"></div>
		<!--<div class="view-all"><a href="{$BaseHref}events/categories/$Title">View All $Events.count Events</a></div>-->

			 <!--<a href="{$BaseHref}events/categories/$Title">View all $Events.count events</a>.-->
		<% else %>
			No events currently listed.
		<% end_if %>
	</div>
 </div>
<% end_control %>


