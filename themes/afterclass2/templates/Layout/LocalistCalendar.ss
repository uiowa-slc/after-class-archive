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
			<% if $EventList %>
				<div class="row">
					<div class="large-12 event-card-list-container columns $FirstLast">
						<h2>$Title</h2>
						<div class="event-card-slider loading">
							<% loop $EventList %>
								<div class="event-card"><% include EventCard %></div>
							<% end_loop %>
						</div>
					</div>
				</div>
			<% end_if %>
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
				<li><div class="event-card odd first"><% with $Calendar %>$CalendarWidget <% end_with %></div></li>
				<% loop $EventList(30) %>
					<li><% include EventCard %></li>
				<% end_loop %>
			</ul> 
		</div>
		<div class="row">

			<div class="blog-card-list-container">
				<h2 class="student-life">Student Life News</h2>
				<ul class="blog-card-list large">
					<% loop $RSSDisplay("5", "http://studentlife.uiowa.edu/news/rss/") %>
						<li><% include BlogCard %></li>
					<% end_loop %>
				</ul>
			</div>
		</div>
	</div>

	<%--<div id="right-column" class="medium-4 columns <% if $action == "index" %>sidebar-sticky-content<% end_if %>">
		<% include SideBar %>
	</div>--%>

</div>

<div class="clear"></div>
