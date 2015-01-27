<%-- include TileGrid --%>

<% if $action == "index" %>
	<div class="marquee">
	<% if $action == "index" %>
		<% if $FeaturedEvents %>
			<div class="slider">
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
<% end_if %>

<div class="row main-content">
	<div class="large-12 columns">
		<div class="event-card-list-container">
			<div class="row">
				<div class="large-12 columns">
					<div class="event-card-header-bar date-bar">
						<div class="row">
							<div class="large-6 columns large-offset-3">
								<h2>$FilterHeader</h2>
							</div>
							<div class="large-3 columns header-bar-menu right">
								<a data-dropdown="calendar-drop" aria-controls="drop", aria-expanded="false" class="calendar-toggle dropdown"><i class="fi-calendar has-dropdown"></i></a><br>
								<div id="calendar-drop" data-dropdown-content class="f-dropdown large" role="menu" aria-hidden="false" tabindex="-1">
								  	<% with $Calendar %>
						 				$CalendarWidget 
									<% end_with %>
								</div>
								<!--<div class="calendar-toggle">
									<i class="fi-calendar has-dropdown"></i>
								</div>-->
							</div>
						</div>
					</div>
				</div>
			</div>
			<% if $action != "index" %>
				<% if not $EventList %>
					<p class="homepage-message">No events currently listed on this date. <a href="{$BaseHref}">Return home</a>, or check our <a href="{$BaseHref}events/categories/">categories</a>, <a href="{$BaseHref}events/venues">venues</a>, and <a href="{$BaseHref}events/sponsors/">sponsors</a> for full event listings.</p>
				<% end_if %>
			<% end_if %>
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
