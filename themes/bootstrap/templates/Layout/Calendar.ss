<% include Header %>

<div class="container content-container" id="content" style="max-width: 500px;">

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
