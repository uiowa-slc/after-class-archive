 <a href="{$BaseHref}events/show/$StartDate.Format("Y-m-d")" class="date-link"><time itemprop="startDate" datetime="$StartDate.format(c)">$StartDate.format(l), $StartDate.format(F) $StartDate.format(j)</time></a>
							<% if EndDate %>
							until <a href="{$BaseHref}events/show/$EndDate.Format("Y-m-d")" class="date-link"><time itemprop="endDate" datetime="$EndDate.format(c)">$EndDate.format(l), $EndDate.format(F) $EndDate.format(j)</time></a>
							<% end_if %>
							<% if StartTime %>
							at $StartTime.Nice
							<% end_if %>
							<% if EndTime %>
							until $EndTime.Nice
							<% end_if %>