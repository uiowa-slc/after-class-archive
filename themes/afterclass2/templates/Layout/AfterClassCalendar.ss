
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

<div class="row">
<div id="left-column" class="span8">
<% if $action != "index" %>
	<h1 class="date-header">Events for $DateHeader</h1>
	<% if not $Events %>
		<p class="homepage-message">No events currently listed on this date. <a href="{$BaseHref}">Return home</a>, or check our <a href="{$BaseHref}events/category/">categories</a>, <a href="{$BaseHref}events/venue">venues</a>, and <a href="{$BaseHref}events/sponsor/">sponsors</a> for full event listings.</p>
	<% end_if %><!-- end if events -->
<% end_if %>
<div style="clear: both"></div>
<div id="event-card-list">
	<% if $action == "index" %>
	<h2>What's up next</h2>
	<% end_if %>
	<div class="event-cards">
		<% loop AllEventsWithoutDuplicates %>
			<% include EventCard %>
		<% end_loop %> <%-- end control Upcoming Events --%>
	</div> <!--end event-cards -->
	</div>
	<!-- end event-card-list -->
</div>
<!-- end left-column -->
<div id="right-column" class="span4">
	<% include SideBar %>
</div>
<!-- end right-column -->
</div><!-- end row -->
<div class="clear"></div>