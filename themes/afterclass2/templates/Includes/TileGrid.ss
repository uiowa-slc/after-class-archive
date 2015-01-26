<div class="row">
	<div id="tile-grid">
		<% loop $EventList.Limit(16) %>
			<div class="item">
				<a href="$Link"><img src="$Image.AbsoluteURL" /></a>
			</div>
		<% end_loop %>

	</div>
</div>