<% if UpcomingDatesAndRanges.Count > 1 %><strong>Next Date:</strong><% end_if %>
						<% if UpcomingDatesAndRanges %>
						<% loop UpcomingDatesAndRanges.First %>
							<% include DateTimesList %>
						<% end_loop %>
						<% else %>
							No upcoming dates.
						<% end_if %>

