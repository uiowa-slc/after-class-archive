<p class="card-subtitle">
	<% if $Dates %>
		<% loop $Dates.Limit(1) %>
			<% with $StartDateTime %>
				<a href="{$Up.Link}"><time itemprop="startDate" datetime="$URLDatetime">$Format(MMM d)</time></a>
			<% end_with %>
			<% if $EndDate %>
			 - 
			<% with $EndDate %>
				<time itemprop="endDate" datetime="$URLDatetime">$Format(MMM d)</time>
			<% end_with %>
			<% end_if %>
		<% end_loop %>
	<% end_if %>
	<% if $Venue %>
		<% with $Venue %>
			<span class="at"> @ </span>
				
			<a href="$Link"><span itemprop="location">$Title.LimitCharacters(25)</span></a>
		
		<% end_with %>
	<% end_if %>	
	<% if $Dates.Count > "1" %>
		<a href="$Link">more dates</a> 
	<% end_if %> 
</p>

