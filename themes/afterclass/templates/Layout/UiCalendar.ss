<% include Header %>
<div class="container-fluid">
	<% if $Content %>
	<div class="calendar-content">
		$Content
	</div>
	<% end_if %>
	<% if $action != "index" %>
		<h1 class="filter-header">$FilterHeader</h1>
	<% end_if %>
		<% if $action == "index" %>
			<% if $EventList("threemonths").Count > 0 %>
				<div class="masonry-grid">
					<% loop $EventList("threemonths") %>
						<% include EventCard %>
					<% end_loop %> <%-- end loop Upcoming Events --%>
				</div>
			<% else %>
				<p class="text-center">There are currently no events listed on After Class. Please check back soon!</p>
			<% end_if %>

		<% else %>
			<% if $FilterEventList.Count > 0 %>
				<div class="masonry-grid">
					<% loop $FilterEventList %>
						<% include EventCard %>
					<% end_loop %> <%-- end loop Upcoming Events --%>
				</div>
			<% else %>
				<p class="text-center">There are currently no events listed in this category.</p>
			<% end_if %>
		<% end_if %>
	</div>
</div>
