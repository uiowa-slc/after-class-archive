<% if $StartDateTime %>
<% with $StartDateTime %>
	
	<a href="$Up.Link" class="date-link">
		<time itemprop="startDate" datetime="$Format(c)">
			$Format(l), $Format(F) $Format(j)
		</time>
	</a> <% if not $Up.AllDay %>$Format("g:i A")<% end_if %>
<% end_with %>
<% end_if %>
<% if $EndTime %>
	<% with $EndTime %>
		- $Format("g:i A")
	<% end_with %>
<% end_if %>
<% if $EndDate %>
	until
	<% with $EndDate %>
			
			<time itemprop="endDate" datetime="$Format(c)">
				$Format(l), $Format(F) $Format(j)
			</time>
		 <% if not $Up.AllDay %>$Format("g:i A")<% end_if %>
	<% end_with %>
<% end_if %>