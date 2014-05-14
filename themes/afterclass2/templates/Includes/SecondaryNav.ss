<div class="secondary-nav row-fluid">
	<div class="secondary-search-form hide-for-large-up">
		<% include Search %>
	</div>
	<div class="show-for-large-up">
		<% with Calendar %>
			$CalendarWidget
		<% end_with %>
	</div>
	<% include QuickFilters %>
</div>
	