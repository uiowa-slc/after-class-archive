<div class="secondary-nav row-fluid">
	<div class="secondary-search-form hide-for-large-up">
		<% include Search %>
	</div>
	<% with $Calendar %>
		<div class="show-for-large-up">
			 $CalendarWidget 
		</div>
		<% include QuickFilters %>
	<% end_with %>
</div>

	