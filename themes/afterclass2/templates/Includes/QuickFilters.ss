<h3>Find Events Near You!</h3>
	<p><a href="nearby/" class="button">See all events nearby</a></p>
	<% cached %>
		<p>
		<strong>Trending:</strong>
		<% loop TrendingCategories.Limit(10) %>
				<a href="$Link" class="button tag">$Title.LimitCharacters(20)</a>
		<% end_loop %>
		</p>
	
		<p><strong>By type:</strong>
		<% loop ActiveEventtypes %>
			<a href = "$Link" class="button tag">$Title.LimitCharacters(20)</a>
		<% end_loop %>
	<% end_cached %>
	
	<p><strong>Filter by:</strong>
	<a href="{$BaseHref}events/categories/" class="button">Event Type</a>
	<a href="{$BaseHref}events/sponsors/" class="button">Sponsor</a>
	<a href="{$BaseHref}events/venues/" class="button">Venue</a></p>	