<p class="dates-times">
	<% if $Dates %>
		<% loop $Dates.Limit(1) %>
			<% with $StartDateTime %>
				<a href="{$Up.Link}" class="date-link"><time itemprop="startDate" datetime="$URLDatetime" class="$FirstLast">$Format(MMM d)</time></a>
			<% end_with %>
			<% if $EndDate %>
			 - 
			<% with $EndDate %>
				<time itemprop="endDate" datetime="$URLDatetime" class="$FirstLast">$Format(MMM d)</time>
			<% end_with %>
			<% end_if %>
		<% end_loop %>
	<% end_if %>
	<% if $Venue %>
		<% with $Venue %>
			<span> @ </span>
				
			<a href="$Link" class="tag button" ><span itemprop="location">$Title.LimitCharacters(25)</span></a>
		
		<% end_with %>
	<% end_if %>	
	<% if $Dates.Count > "1" %>
		<a href="$Link" class="button more-dates">more dates</a> 
	<% end_if %> 
</p>

