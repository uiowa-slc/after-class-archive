	<p>
		<% if $URLSegment != "nearby" %>
			<a href="nearby/" class="button">See all events nearby</a>
		<% end_if %>
		<a href="add/" class="button">Add Your Event</a>
	</p>
	<% cached %>
<%-- 		<p>
		<strong>Trending:</strong>
		<% loop $TrendingTags.Limit(10) %>
				<a href="$Link" class="button tag">$Title.LimitCharacters(20)</a>
		<% end_loop %>
		</p> --%>
	
	<% end_cached %>
	
	<%--<p><strong>Filter by:</strong>
	<a href="{$BaseHref}events/categories/" class="button">Event Type</a>
	<a href="{$BaseHref}events/sponsors/" class="button">Sponsor</a>
	<a href="{$BaseHref}events/venues/" class="button">Venue</a></p>--%>