<div class="row">
<div id="left-column" class="medium-8 columns">

<% if $action == "index" %>
	<% if FeaturedEvents %>
		<div class="flexslider">
			<div class="slides">
				<% loop FeaturedEvents %>
					<div class="slide">
						<% include HeroEvent %>	
					</div>
				<% end_loop %><!-- end control FeaturedEvents.First -->
			</div>
		</div>
	<% else %>
			<% loop Events.First %>
				<% loop Event %>
					<% if CancelReason %>
					<% else %>
						<% include HeroEvent %>
					<% end_if %><!-- end if cancelreason -->
				<% end_loop %>
			<% end_loop %>
	<% end_if %> <!-- end if featured events -->
<% end_if %>

<% if $action != "index" %>
	<h1 class="date-header">Events for $DateRange</h1>
	<% if not $EventList %>
		<p class="homepage-message">No events currently listed on this date. <a href="{$BaseHref}">Return home</a>, or check our <a href="{$BaseHref}events/categories/">categories</a>, <a href="{$BaseHref}events/venues">venues</a>, and <a href="{$BaseHref}events/sponsors/">sponsors</a> for full event listings.</p>
	<% end_if %><!-- end if events -->
<% end_if %>
<div style="clear: both"></div>
<div class="event-card-list">
	<% if $action == "index" %>
		<h2>What's up next</h2>
		<div class="event-cards">
			<% loop $EventList %>
				<% include EventCard %>
			<% end_loop %> <%-- end control Upcoming Events --%>
		</div> <!--end event-cards -->
	<% else %><%-- if we're not using the index action, list the calendar's default events for dates, date ranges, etc --%>
		<div class="event-cards">
			<% loop $EventList %>
				<% with Event %>
					<% include EventCard %>
				<% end_with %>
			<% end_loop %> <%-- end control Upcoming Events --%>
		</div> <!--end event-cards -->	
	<% end_if %>
</div>
	<!-- end event-card-list -->
</div>
<!-- end left-column -->
<div id="right-column" class="medium-4 columns">
	<% include SideBar %>
</div>
<!-- end right-column -->
</div><!-- end row -->
<div class="clear"></div>