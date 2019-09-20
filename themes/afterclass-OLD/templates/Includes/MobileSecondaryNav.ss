<div class="secondary-nav row-fluid">
	<div class="secondary-search-form hide-for-large-up">
		<% include Search %>
	</div>
	<% with Calendar %>
		$CalendarWidget
	<% end_with %>

	<% include QuickFilters %>
</div>
	