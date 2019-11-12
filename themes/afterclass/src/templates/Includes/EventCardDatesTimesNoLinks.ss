<p class="card-subtitle">
	<% if $Dates %>
		<% loop $Dates.Limit(1) %>
			<% with $StartDateTime %>
				<time itemprop="startDate" datetime="$URLDatetime">$Format("MMM d, h:mm a")</time>
			<% end_with %>
			<% if $EndDate %>
			 - 
			<% with $EndDate %>
				<time itemprop="endDate" datetime="$URLDatetime">$Format("MMM d, h:mm a")</time>
			<% end_with %>
			<% end_if %>
		<% end_loop %>
	<% end_if %>
	<% if $Venue %>
		<% with $Venue %>
			<span class="at"> @ </span>
				
			<span itemprop="location">$Title.LimitCharacters(25)</span>
		
		<% end_with %>
	<% end_if %>	
	<% if $Dates.Count > "1" %>
		<a href="$AbsoluteLink"> | more dates</a> 
	<% end_if %> 
</p>

