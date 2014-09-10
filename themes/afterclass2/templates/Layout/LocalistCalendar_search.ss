<div class="row main-content">
<div id="left-column" class="medium-8 columns">
<div class="event-card-list">
	<h2>Search Results for "$Term" on <a href="http://events.uiowa.edu/" target="_blank">events.uiowa.edu</a></h2>
	<% if $Results %>
	<p>The following results are for all events on campus and clicking them will redirect you to events.uiowa.edu: </p>
	<div class="event-cards">
		<% loop $Results %>
			<% include EventCard_search %>
		<% end_loop %> <%-- end control Upcoming Events --%>
	</div> <!--end event-cards -->
	<% else %>
	<p>Sorry, no events were found with this search term. <a href="nearby/"> Find events nearby,</a> or <a href="http://events.uiowa.edu/" target="_blank">see all events on campus at events.uiowa.edu</a></p>
	<% end_if %>
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