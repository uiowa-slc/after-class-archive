							<div class="event_date_tag">
								<% control UpcomingDates %>
								<% if First %>
									<a href="{$BaseHref}events/view/$StartDate.Format(Ymd)" class="date-link">
									<div class="event_date_box">$StartDate.format(M) <strong>$StartDate.format(j)</strong> $StartDate.format(D)</div>
									</a>
								<% end_if %>
								<% end_control %>
							</div>