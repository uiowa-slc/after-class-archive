<div class="row">
<div class="medium-8 columns">
<header id="secondary_header">
	<h1> $Venue.Title </h1>
</header>
<div class="category">
	<div class="about-category">
		
		<div class="category-content">
			<% if $Venue.Content %><p class="category-information">$Venue.Content</p><% end_if %>
			<% if $Venue.Address %><p></p><% end_if %>
			<div class="clear"></div>
			<% if $Venue.Phone %><p>$Phone</p><% end_if %>
			<% if $Venue.Email %><a href="mailto: $Email">$Email</a></p><% end_if %>
			<% if $Venue.LinkURL %><p><a class="button" href="$LinkURL" target="_blank">Visit Website &raquo; </a></p><% end_if %>
			<% if $Venue.WebsiteURL %><p><a class="button" href="$WebsiteURL" target="_blank">Visit the $Title Website</a></p>
			<a class="button get-directions" href="http://www.google.com/maps?f=d&daddr=$Address" target="_blank">Get Directions</a></p><% end_if %>
			
			<div class="clear"></div>
		</div><!-- end category-content -->
		<div class="clear"></div>
	</div><!-- end about-category -->
	
	<h2>$FilterHeader</h2>

	<div class="category-list">
		<% if EventList %>
			<% loop EventList %>
			<div class="event-cards">
				<% include EventCard %>
			</div>
			<% end_loop %>
			<div style="clear: both"></div>
		<% else %>
			No events currently listed.
		<% end_if %>
	</div><!-- end category-list -->
</div><!-- end category -->
</div><!-- end medium-8 columns -->
<div class="medium-4 columns">
	<% include SideBar %>
</div>
</div><!-- end row -->
