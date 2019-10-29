<% include Header %>
<div class="container-fluid">
	<% if $action != "index" %>
		<h1 class="filter-header">$FilterHeader</h1>
	<% end_if %>
	<div class="card-columns">
		<% if $action == "index" %>
			<% loop $EventList("threemonths") %>
				<% include EventCard %>
			<% end_loop %> <%-- end loop Upcoming Events --%>
		<% else %>
			<% loop $FilterEventList %>
				<% include EventCard %>
			<% end_loop %> <%-- end loop Upcoming Events --%>
		<% end_if %>
	</div>
</div>
