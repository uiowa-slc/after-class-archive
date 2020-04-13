<% include Header %>
<div class="container" style="max-width: 800px;">
	<div class="calendar-content">
		$Content
	</div>

	
		<% loop $Children %>
			<% include SocialCard %>
		<% end_loop %>



	</div>
</div>
