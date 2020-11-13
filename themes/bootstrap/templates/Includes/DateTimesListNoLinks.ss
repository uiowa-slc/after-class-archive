<% if $StartDateTime != "" %>
<% with $StartDateTime %>


        <span itemprop="startDate" datetime="$Rfc3339">
            $Format(EEEE), $Format(MMMM d)</span><% if not $Up.AllDay %>,<% end_if %><% if not $Up.AllDay %> $Format("h:mm a")<% end_if %>
<% end_with %>
<% end_if %>
<% if $EndTime != "" %>
    <% with $EndTime %>
        - $Format("h:mm a")
    <% end_with %>
<% end_if %>
<% if $EndDateTime != "" %>
    until
    <% with $EndDateTime %>
            <time itemprop="endDate" datetime="$Rfc3339">
                $Format(EEEE), $Format(MMMM d),</time>
         <% if not $Up.AllDay %>$Format("h:mm a")<% end_if %>
    <% end_with %>
<% end_if %>
