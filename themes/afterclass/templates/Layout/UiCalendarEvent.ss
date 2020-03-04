<% if $Image.Orientation == "Wide" %>
	<% include UiCalendarEventHorizontal %>
<% else %>

	<% include UiCalendarEventVertical %>
<% end_if %>
