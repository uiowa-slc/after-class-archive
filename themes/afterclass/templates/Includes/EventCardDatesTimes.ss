<p class="card-subtitle text-uppercase">

	<% if $Dates %>
		<% loop $Dates.Limit(1) %>
			<% with $StartDateTime %>
				<a href="{$Up.Link}"><span itemprop="startDate" datetime="$Rfc3339">$Format("MMM d, h:mm a")</span></a>
			<% end_with %>
			<% if $EndDate %>
			 -
			<% with $EndDate %>
				<span itemprop="endDate" datetime="$Rfc3339">$Format("MMM d, h:mm a")</span>
			<% end_with %>
			<% end_if %>
		<% end_loop %>
	<% end_if %>
    <% if not $isOnline %>
    	<% if $Venue %>
    		<% with $Venue %>
    			 @
    			<a href="$Link"><span itemprop="location">$Title.LimitCharacters(25)</span></a>
    		<% end_with %>
    	<% else_if $Location %>
    		@ <span itemprop="location">$Location</span>
    	<% end_if %>
    	<% if $Dates.Count > "1" %>
    		<a href="$Link"> | more dates</a>
    	<% end_if %>
    <% else %>
        Online Event <i class="fas fa-laptop-house"></i>
    <% end_if %>
</p>

