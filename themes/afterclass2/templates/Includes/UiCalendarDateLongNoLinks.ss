<% with $StartDateTime %>
		<time itemprop="startDate" datetime="$ISOFormat">
			$Format(l), $Format(F) $Format(j) at $Format("g:i A")
		</time>
<% end_with %>
<% if $EndTime %>
	<% with $EndTime %>
		- $Format("h:mm a")
	<% end_with %>
<% end_if %>
<% if $EndDate %>
	until
	<% with $EndDate %>
			<time itemprop="endDate" datetime="$ISOFormat">
			$Format("h:mm a")on $Format(l), $Format(F) $Format(j)
			</time>
	<% end_with %>
<% end_if %>