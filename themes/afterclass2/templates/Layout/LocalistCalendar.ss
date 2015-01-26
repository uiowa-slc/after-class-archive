<%-- include TileGrid --%>


<div class="marquee row">
<% if $action == "index" %>
	<% if $FeaturedEvents %>
		<div class="slider large-12">
			<% loop $FeaturedEvents %>
				<div class="slide">
					<% include HeroEvent %>
				</div>
			<% end_loop %><!-- end control FeaturedEvents.First -->
		</div>
	<% else %>
		<% loop $EventList.First %>
			<% include HeroEvent %>
		<% end_loop %>
	<% end_if %> <!-- end if featured events -->
<% end_if %>
</div>

<% if $FeaturedCategories %>
	<% loop $FeaturedCategories %>
		<div class="row">
			<div class="large-12 columns event-card-list-container $FirstLast">
				<h2>$Title</h2>
				<div class="event-card-slider">
					<% loop $EventList %>
						<% include EventCard %>
					<% end_loop %>
				</div>
			</div>
		</div>
	<% end_loop %>
<% end_if %>

<div class="row main-content">
	<div class="large-12 columns">
	<% if $action != "index" %>
		<h1 class="date-header">$FilterHeader</h1>
		<% if not $EventList %>
			<p class="homepage-message">No events currently listed on this date. <a href="{$BaseHref}">Return home</a>, or check our <a href="{$BaseHref}events/categories/">categories</a>, <a href="{$BaseHref}events/venues">venues</a>, and <a href="{$BaseHref}events/sponsors/">sponsors</a> for full event listings.</p>
		<% end_if %>
	<% end_if %>
		<div class="event-card-list-container">
			<div class="event-card-header-bar row">
				<div class="large-6 columns large-offset-3">
					<h2>January 26 - March 26</h2>
				</div>
				<div class="large-3 columns calendar-menu">
					<button data-dropdown="drop" aria-controls="drop", aria-expanded="false" class="large alert round button dropdown">Dropdown Button</button><br>
					<ul id="drop" data-dropdown-content class="f-dropdown" role="menu" aria-hidden="false" tabindex="-1">
					  <li><a href="#">This is a link</a></li>
					  <li><a href="#">This is another</a></li>
					  <li><a href="#">Yet another</a></li>
					</ul>
					<!--<div class="calendar-toggle">
						<i class="fi-calendar has-dropdown"></i>
					</div>-->
				</div>
			</div>
			<ul class="event-card-list large">
				<% loop $EventList %>
					<li><% include EventCard %></li>
				<% end_loop %>
			</ul> 
		</div>
	</div>

	<%--<div id="right-column" class="medium-4 columns <% if $action == "index" %>sidebar-sticky-content<% end_if %>">
		<% include SideBar %>
	</div>--%>

</div>

<div class="clear"></div>
