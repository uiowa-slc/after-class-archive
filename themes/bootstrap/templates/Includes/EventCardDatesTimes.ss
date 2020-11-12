<p class="card-subtitle text-uppercase">

	<% if $Dates %>
    <span class="d-inline-block mr-2">
    <i aria-hidden="true" class="far fa-calendar-alt"></i>
		<% loop $Dates.Limit(1) %>
			<% with $StartDateTime %>
				<a href="{$Up.Link}"><span itemprop="startDate" datetime="$Rfc3339">$Format("EEE, MMM d, h:mm a")</span></a>
			<% end_with %>
			<% if $EndDate %>
			 -
			<% with $EndDate %>
				<span itemprop="endDate" datetime="$Rfc3339">$Format("MMM d, h:mm a")</span>
			<% end_with %>
			<% end_if %>
		<% end_loop %>
    </span>
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
    		<a href="$Link"> more dates</a>
    	<% end_if %>
    <% else %>
        <i aria-hidden="true" class="fas fa-laptop"></i> Virtual Event
    <% end_if %>
</p>

