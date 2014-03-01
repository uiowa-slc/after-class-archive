	<div class="event-card $EvenOdd $FirstLast <% if Event.CancelReason %>canceled<% end_if %> id-{$Event.ID}" itemscope itemtype="http://data-vocabulary.org/Event" onClick="location.href='$Link'">
		<div class="event-card-header">
			<h3 class="big-cell">
				<a href="$Link" itemprop="url">
					<span itemprop="summary">$Title</span><% if Event.CancelReason %>
					<div class="homepage-cancel-reason">
						Note: $CancelReason</d><% end_if %>
				</a>
			</h3>
			<% if Eventtypes %>
				<% loop Eventtypes.First %>
					<a class="event-header-category" href="$Link">$Title</a>
				<% end_loop %>
			<% end_if %>
			<div style="clear: both"></div>
			</div>
			<div style="clear: both"></div>
				<div class="event-card-image">
					<a href="$Link">
					<% if Image %>
						<% loop Image %>
							<% loop CroppedImage(250,158) %><img class="" itemprop="photo" src="$URL" /><% end_loop %>
						<% end_loop %>
					<% end_if %>
					</a>
				</div><!-- end event-card-image -->
			<div class="event-card-content">
			<h3 class="small-cell">
				<a href="$Link">
					<span>$Title</span><% if Event.CancelReason %>
					<div class="homepage-cancel-reason">
						Note: $Event.CancelReason</d><% end_if %>
				</a>
			</h3>
				<div class="event-card-desc">
					<p>$Content.Summary(30) <a href="$Link" class="read-more-link">read more &raquo;</a></p>
					<div class="event-card-meta">
						<div class="when">
							<ul class="dates">
								<% if UpcomingDatesAndRanges.Limit(2) %>
									<% loop UpcomingDatesAndRanges.Limit(2) %>
										<li> <a href="{$BaseHref}events/show/$StartDate.Format("Y-m-d")" class="date-link"><time itemprop="startDate" datetime="$StartDate.format(c)" class="<% if $EndDate %>range<% end_if %> $FirstLast">$StartDate.format(M) $StartDate.format(j)</time></a>
											<% if EndDate %>
											to <a href="{$BaseHref}events/show/$EndDate.Format("Y-m-d")" class="date-link"><time itemprop="endDate" datetime="$EndDate.format(c)">$EndDate.format(M) $EndDate.format(j)</time></a><% end_if %>	
										</li>
									<% end_loop %>
									<% if DateAndTime.Count > "2" %>
										<li> <a href="$Link">more dates </a></li>
									<% end_if %>
								<% end_if %> <!-- end if Event.UpcomingDates(1) -->
							</ul>
							<div class="clear"></div>
						</div>
						<div class="where">
							<% if Venues %>
								<ul>
								<% if Location %><span> @ </span>{$Location}<% end_if %>
										<% loop Venues %>
											<li>
												<% if $First && not $Top.Location %>
												<span> @ </span>
												<% end_if %>
												<span itemprop="location" itemscope itemtype="http://data-vocabulary.org/​Organization">
													 <a href="$Link" ><span itemprop="name">$Title</span></a>
												</span>
											</li>
									<% end_loop %>
								</ul>
							<% end_if %>
						</div><!-- end where -->
						<div style="clear: both"></div>
					</div>
					<!-- end event-card-meta -->
				</div>
				<!-- end event-card-desc -->
				<div style="clear: both;"></div>
			</div>
			<!-- end event-card-content -->
		</div>
		<!-- end event-card -->