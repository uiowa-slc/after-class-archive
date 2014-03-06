<p class="dates-times">
	<% if UpcomingDatesAndRanges %>
		<% loop UpcomingDatesAndRanges.Limit(1) %>
			<a href="{$BaseHref}events/show/$StartDate.Format("Y-m-d")" class="date-link"><time itemprop="startDate" datetime="$StartDate.format(c)" class="$FirstLast">$StartDate.format(M) $StartDate.format(j)</time></a>
			<% if EndDate %>
				to <a href="{$BaseHref}events/show/$EndDate.Format("Y-m-d")" class="date-link"><time itemprop="endDate" datetime="$EndDate.format(c)">$EndDate.format(M) $EndDate.format(j)</time></a>
			<% end_if %>
		<% end_loop %>
		
	<% end_if %>
	<% if Location %><span> @ </span>{$Location}<% end_if %>
	<% loop Venues %>
		<% if $First && not $Top.Location %>
			<span> @ </span>
		<% end_if %>
		<span itemprop="location" itemscope itemtype="http://data-vocabulary.org/​Organization">
			<a href="$Link" ><span itemprop="name">$Title.LimitCharacters(25)</span></a>
		</span>	
	<% end_loop %>	
	<% if UpcomingDatesAndRanges.Count > "1" %><a href="$Link" class="button more-dates">more dates</a> <% end_if %>
</p>
