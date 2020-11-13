<% if $Dates %>
<div><% if $Dates.Count > 1 %><strong>Next Date:</strong><% else %><strong>Date:</strong><% end_if %>
    <% loop $Dates.Limit(1) %>
        <% include DateTimesListNoLinks %>
    <% end_loop %>
    <% if $Dates.Count > 1 %> <a href="$AbsoluteLink">More Dates</a><% end_if %>
</div>
<% end_if %>
<div style="margin-bottom: 10px;">
<% if $isOnline %>
<strong>Location: </strong>Virtual Event<br />
<% else %>


    <% if $Venue.Title || $Location %>
    <strong> Location: </strong>
        <span itemprop="location">
            <% if $Location %> $Location<% if $Venue.Title %>,<% end_if %> <% end_if %>
            <% if $Venue.Title %>
                <% with $Venue %>
                    <% if $Link %>
                        <a href="$Link">$Title</a>
                    <% else %>
                        $Title
                    <% end_if %>
                <% end_with %>
            <% end_if %>
        </span>
    <% end_if %>
<% end_if %>

</div>
