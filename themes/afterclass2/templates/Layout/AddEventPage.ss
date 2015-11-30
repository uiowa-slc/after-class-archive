<div class="row">
	<div class="medium-8 columns">
		<header id="secondary_header">
			<h1>Submit An Event</h1>
		</header>
		<div id="single-page-content">
			$Content
		</div>
		<% with $Calendar %>
			<% loop $EventListByDate("2015-08-13") %>
				<h1>$Title</h1>
			<% end_loop %>
		<% end_with %>
	</div>
	<div class="medium-4 columns">
		<% include SideBar %>
	</div>
</div>
