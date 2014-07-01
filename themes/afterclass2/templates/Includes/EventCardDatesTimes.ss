<p class="dates-times">
	<%--
	<% if UpcomingDatesAndRanges %>
		<% loop UpcomingDatesAndRanges.Limit(1) %>
			<a href="{$BaseHref}events/show/$StartDate.Format("Y-m-d")" class="date-link"><time itemprop="startDate" datetime="$StartDate.format(c)" class="$FirstLast">$StartDate.format(M) $StartDate.format(j)</time></a>
			<% if EndDate %>
				to <a href="{$BaseHref}events/show/$EndDate.Format("Y-m-d")" class="date-link"><time itemprop="endDate" datetime="$EndDate.format(c)">$EndDate.format(M) $EndDate.format(j)</time></a>
			<% end_if %>
		<% end_loop %>
	<% end_if %>
	--%>
	<% if $NextDateTime %>
		<a href="$DateLink" class="date-link" ><time itemprop="startDate" datetime="$NextDateTime.NiceUS" class="$FirstLast">$NextDateTime.ShortMonth() $NextDateTime.DayOfMonth()</time></a>
	<% end_if %>	
	
	<% if Location %><span> @ </span>{$Location}<% end_if %>
	
	<% if $VenueTitle %>
			<span> @ </span>
		<span itemprop="location" itemscope itemtype="http://data-vocabulary.org/​Organization">
			<a href="$VenueLink" class="tag button" ><span itemprop="name">$VenueTitle.LimitCharacters(25)</span></a>
		</span>	
	<% end_if %>	
	
	<% if $MoreDateTime>='1' %><a href="$Link" class="button more-dates"> $MoreDateTime more dates</a> <% end_if %>
	
</p>

