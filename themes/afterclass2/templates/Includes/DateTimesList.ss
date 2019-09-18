<% if $StartDateTime %>
<% with $StartDateTime %>
	
	<a href="$Up.Link" class="date-link">
		<time itemprop="startDate" datetime="$URLDatetime">
			$Format(EEEE), $Format(MMMM d)
		</time>
	</a> <% if not $Up.AllDay %>$Format("h:mm a")<% end_if %>
<% end_with %>
<% end_if %>
<% if $EndTime %>
	<% with $EndTime %>
		- $Format("h:mm a")
	<% end_with %>
<% end_if %>
<% if $EndDate %>
	until
	<% with $EndDate %>
			
			<time itemprop="endDate" datetime="$URLDatetime">
				$Format(EEEE), $Format(MMMM d)
			</time>
		 <% if not $Up.AllDay %>$Format("h:mm a")<% end_if %>
	<% end_with %>
<% end_if %>