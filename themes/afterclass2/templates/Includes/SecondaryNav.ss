<div class="secondary-nav row-fluid">
	<div class="secondary-search-form">
		<% include Search %>
	</div>
	<% with Calendar %>
		$CalendarWidget
	<% end_with %>
			
	<p><strong>Trending:</strong><% loop TrendingCategories.Limit(10) %>
			<a href="$Link" class="button tag">$Title.LimitCharacters(20)</a>
	<% end_loop %></p>
	
	<p><strong>View By:</strong>
	<a href="{$BaseHref}events/categories/" class="button">Event Type</a>
	<a href="{$BaseHref}events/sponsors/" class="button">Sponsor</a>
	<a href="{$BaseHref}events/venues/" class="button">Venue</a></p>	
</div>
	