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
<div class="row main-content">

<div id="left-column" class="medium-8 columns">

<% if $action != "index" %>
	<h1 class="date-header">$FilterHeader</h1>
	<% if not $EventList %>
		<p class="homepage-message">No events currently listed on this date. <a href="{$BaseHref}">Return home</a>, or check our <a href="{$BaseHref}events/categories/">categories</a>, <a href="{$BaseHref}events/venues">venues</a>, and <a href="{$BaseHref}events/sponsors/">sponsors</a> for full event listings.</p>
	<% end_if %><!-- end if events -->
<% end_if %>

<div style="clear: both"></div>
<div class="event-card-list">
	<% if $action == "index" %>
		<h2>What's up next</h2>
	<% end_if %>
	<div class="event-cards">
		<% loop $EventList %>
			<% include EventCard %>
		<% end_loop %> <%-- end loop Upcoming Events --%>
	</div> <!--end event-cards -->
</div>
	<!-- end event-card-list -->
</div>
<!-- end left-column -->
<div id="right-column" class="medium-4 columns <% if $action == "index" %>sidebar-sticky-content<% end_if %>">
	<% include SideBar %>
</div>
<!-- end right-column -->
</div><!-- end row -->
<div class="clear"></div>
