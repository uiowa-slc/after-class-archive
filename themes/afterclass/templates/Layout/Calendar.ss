<% include Header %>

<div class="container" style="max-width: 800px;">

	<% if $Action == "index" %>
	<div class="calendar-content">
		$Content
	</div>
	<% end_if %>

	
	<% loop $EventList %>
		$SocialCardHTML
	<% end_loop %>



	</div>
</div>
