<div class="event-card-wrapper">
	<div class="event-card $EvenOdd $FirstLast <% if Event.CancelReason %>canceled<% end_if %> id-{$Event.ID}" itemscope itemtype="http://data-vocabulary.org/Event" onClick="location.href='$Event.Link'">
		<div class="event-card-header">
			<h3 class="big-cell">
				<a href="$Link" itemprop="url">
					<span itemprop="summary">$Title</span><% if Event.CancelReason %>
					<div class="homepage-cancel-reason">
						Note: $CancelReason</d><% end_if %>
				</a>
			</h3>
		
			<% if Eventtypes %>
				<% control Eventtypes.First %>
					<a class="event-header-category" href="$Link">$Title</a>
				<% end_control %>
			<% end_if %>
			<div style="clear: both"></div>
			</div>
			<div style="clear: both"></div>
			<div class="event-card-content">
				<div class="event-card-image">
				
					<a href="$Link">
					<% if Image %>
						<% control Image %>
							<% control CroppedImage(250,158) %><img class="" itemprop="photo" src="$URL" /><% end_control %>
						<% end_control %>
					<% end_if %>
					</a>
				
				</div>
				
			<h3 class="small-cell">
				<a href="$Link">
					<span>$Title</span><% if Event.CancelReason %>
					<div class="homepage-cancel-reason">
						Note: $Event.CancelReason</d><% end_if %>
				</a>
			</h3>
				<!-- end event-card-image -->
				<div class="event-card-desc">
			
					<p>$Content.Summary(30) <a href="$Link" class="read-more-link">read more &raquo;</a></p>
				
					<div class="event-card-meta">
						<div class="where">
							<% if Venues %>
							<ul>
								<% control Venues %>
									<li>	<span itemprop="location" itemscope itemtype="http://data-vocabulary.org/​Organization">
										@ <a href="$Link" ><span itemprop="name">$Title</span></a>
										</span>
									</li>
								<% end_control %>
							</ul>
							<% end_if %>
						</div><!-- end where -->
						
						<div class="when">
							<ul class="dates">
						
								<% if DateAndTimeLimited(2) %>
								<% control DateAndTimeLimited(2) %>
									<li> <a href="{$BaseHref}events/view/$StartDate.Format(Ymd)" class="date-link"><time itemprop="startDate" datetime="$StartDate.format(c)">$StartDate.format(M). $StartDate.format(j)</time> </a> <% if StartTime %>
										at $StartTime.Nice
										<% end_if %>
										<% if EndDate %>
										until <a href="{$BaseHref}events/view/$EndDate.Format(Ymd)" class="date-link"> <time itemprop="endDate" datetime="$EndDate.format(c)">$EndDate.format(M). $EndDate.format(j)</time> </a>
										<% end_if %>
									</li>
								<% end_control %>
						
									<% if DateAndTimeMoreThan(2) %>
										<a href="$Link" class="more-dates-link">more dates &raquo;</a>
									<% end_if %>
								
								<% end_if %> <!-- end if Event.UpcomingDates(1) -->
								
							</ul>
						</div>
						<div style="clear: both"></div>
					</div>
					<!-- end event-card-meta -->
				</div>
				<!-- end event-card-desc -->
				<div style="clear: both;"></div>
				<div class="event-card-bottom">
					<div class="event-share-container">
						<div class="addthis_toolbox addthis_default_style"	addthis:url="{$Event.AbsoluteLink}"
							addthis:title="{$Event.Title}"
							addthis:description="">
							<a class="addthis_button_facebook"></a>
							<a class="addthis_button_twitter"></a>    
							<a class="addthis_button_google_plusone_share"></a>
							<a class="addthis_button_tumblr"></a>    
							<a href="http://addthis.com/bookmark.php?v=250" class="addthis_button_compact"></a>
						</div>
						<div class="clear"></div>
					</div>
					<div class="more-event-info-link">
						<a href="$Link" class="more-event-info">view event</a>
					</div>
					<div class="clear"></div>
				</div>
				<!-- end event-card-bottom -->
				<div class="clear"></div>
			</div>
			<!-- end event-card-content -->
		</div>
		<!-- end event-card -->
		</div>
