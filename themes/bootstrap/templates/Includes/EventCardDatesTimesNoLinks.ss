<p class="card-subtitle">
	<% if $Dates %>
		<% loop $Dates.Limit(1) %>
			<% with $StartDateTime %>
				<time itemprop="startDate" datetime="$Rfc3339">$Format("EEE, MMM d, h:mm a")</time>
			<% end_with %>
			<% if $EndDate %>
			 -
			<% with $EndDate %>
				<time itemprop="endDate" datetime="$Rfc3339">$Format("EEE, MMM d, h:mm a")</time>
			<% end_with %>
			<% end_if %>
		<% end_loop %>
	<% end_if %>
	<% if $Venue %>
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
	<% if $Dates.Count > "1" %>
		<a href="$AbsoluteLink"> more dates</a>
	<% end_if %>
</p>

