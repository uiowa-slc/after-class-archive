<div class="row">
<div class="medium-8 columns">
<header id="secondary_header">
	<% if Category.AltTitle %>
	<h1>$Category.AltTitle</h1>
	<% else %>
	<h1> $Category.Title </h1>
	<% end_if %>
</header>
<div class="category">
	<div class="about-category">
		<% with Category %>
		<div class="category-content">
			<% if Information %><p class="category-information">$Information</p><% end_if %>
			<% if Address %><p>
			<div class="clear"></div>
			<% if Phone %><p>$Phone</p><% end_if %>
			<% if Email %><a href="mailto: $Email">$Email</a></p><% end_if %>
			<% if LinkURL %><p><a class="button" href="$LinkURL" target="_blank">Visit Website &raquo; </a></p><% end_if %>
			<% if WebsiteURL %><p><a class="button" href="$WebsiteURL" target="_blank">Visit the $Title Website</a></p>
			<a class="button button--green" href="http://www.google.com/maps?f=d&daddr=$Address" target="_blank">Get Directions</a></p><% end_if %>
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
	<% end_if %>

	<div class="category-list">
		<% if Events %>
			<% loop Events %>
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
<% end_with %>
</div><!-- end medium-8 columns -->
<div class="medium-4 columns">
	<% include SideBar %>
</div>
</div><!-- end row -->