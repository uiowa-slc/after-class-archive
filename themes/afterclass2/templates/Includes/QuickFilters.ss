
	<% cached %>
		<p>
		<span class="button tag">Trending:</span>
		<% loop $TrendingTags.Limit(6) %>
				<a href="$Link(false)" class="button tag">$Title.LimitCharacters(20)</a>
		<% end_loop %>
		<% loop $TrendingTypes.Limit(6) %>
			<a href = "$Link(false)" class="button tag">$Title.LimitCharacters(20)</a>
		<% end_loop %>
		</p>
	<% end_cached %>
	
	<%--<p><strong>Filter by:</strong>
	<a href="{$BaseHref}events/categories/" class="button">Event Type</a>
	<a href="{$BaseHref}events/sponsors/" class="button">Sponsor</a>
	<a href="{$BaseHref}events/venues/" class="button">Venue</a></p>--%>