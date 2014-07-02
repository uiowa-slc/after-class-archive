<p class="dates-times">
	<% if $Dates %>
		<% loop $Dates.Limit(1) %>
			<a href="{$Link}" class="date-link"><time itemprop="startDate" datetime="$Format(c)" class="$FirstLast">$Format(M) $Format(j)</time></a>
		<% end_loop %>
	<% end_if %>
	<% if Location %><span> @ </span>{$Location}<% end_if %>
	
	<% if $VenueTitle %>
			<span> @ </span>
		<span itemprop="location" itemscope itemtype="http://data-vocabulary.org/​Organization">
			<a href="$VenueLink" class="tag button" ><span itemprop="name">$VenueTitle.LimitCharacters(25)</span></a>
		</span>	
	<% end_if %>	
	<% if $Dates.Count > "1" %>
		<a href="$Link" class="button more-dates">more dates</a> 
	<% end_if %> 
</p>

