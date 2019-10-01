
<% include Header %>


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

