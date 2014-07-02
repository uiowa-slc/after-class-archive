 <a href="$Link" class="date-link"><time itemprop="startDate" datetime="$Format(c)">$Format(l), $Format(F) $Format(j)</time></a>
							<% if EndDate %>
							until <a href="$Link" class="date-link"><time itemprop="endDate" datetime="$EndDate.format(c)">$EndDate.format(l), $EndDate.format(F) $EndDate.format(j)</time></a>
							<% end_if %>
							<% if $StartTime %>
							<% if $EndDate %>starting<% end_if %> at $StartTime.Nice
							<% end_if %>
							<% if EndTime %>
							until $EndTime.Nice
							<% end_if %>