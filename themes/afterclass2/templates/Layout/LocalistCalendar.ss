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
				<div class="large-12 columns event-card-list-container">
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
<div id="left-column" class="medium-8 columns">

<% if $action != "index" %>
	<h1 class="date-header">$FilterHeader</h1>
	<% if not $EventList %>
		<p class="homepage-message">No events currently listed on this date. <a href="{$BaseHref}">Return home</a>, or check our <a href="{$BaseHref}events/categories/">categories</a>, <a href="{$BaseHref}events/venues">venues</a>, and <a href="{$BaseHref}events/sponsors/">sponsors</a> for full event listings.</p>
	<% end_if %><!-- end if events -->
<% end_if %>

<div style="clear: both"></div>


	<div class="event-card-list-container">
		<h2>What's up next</h2>
		<ul class="event-card-list">
			<% loop $EventList %>
				<li><% include EventCard %></li>
			<% end_loop %> <%-- end loop Upcoming Events --%>
		</ul> <!--end event-cards -->
	</div>
</div>
<!-- end left-column -->
<div id="right-column" class="medium-4 columns <% if $action == "index" %>sidebar-sticky-content<% end_if %>">
	<% include SideBar %>
</div>
<!-- end right-column -->
</div><!-- end row -->
<div class="clear"></div>
