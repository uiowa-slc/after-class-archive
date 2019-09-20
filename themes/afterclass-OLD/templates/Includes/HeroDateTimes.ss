<% if $Dates.Count > 1 %><strong>Next Date:</strong><% end_if %>
<% if $Dates %>
	<% loop $Dates.Limit(1) %>
		<% include DateTimesList %>
	<% end_loop %>
<% else %>
		No upcoming dates.
<% end_if %>

