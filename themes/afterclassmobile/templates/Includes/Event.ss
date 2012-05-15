<div class="event $EvenOdd $FirstLast <% if Event.CancelReason %>canceled<% end_if %>" itemscope itemtype="http://data-vocabulary.org/Event">
	
		<div class="event-header">
			<h3><a href="$Event.Link" itemprop="url"><span itemprop="summary">$Event.Title</span><% if Event.CancelReason %><span class="homepage-cancel-reason">Note: $Event.CancelReason</span><% end_if %></a></h3><% control Event %><% if Eventtypes %><% control Eventtypes.First %><a class="event-header-category" href="$Link">Category: $Title</a><% end_control %><% end_control %><% end_if %>
			
		<div style="clear: both"></div>
		
		</div>
		<div class="event-meta">

			<div class="event-image">
					<% control Event %>
					<a href="$Link">
						<% if Image %>
							<% control Image %>
								<% control CroppedImage(153,153) %><img itemprop="photo" src="$URL" /><% end_control %>
							<% end_control %>
						<% end_if %>
					</a>
	
					<div><a href="$Link" class="more-event-info">view event</a></div>
				<% end_control %>
			</div><!-- end event-image -->								
				
				<div class="where">
					<% if Event.Venues %>
						<ul>
						<% control Event.Venues %>
							<li>	<span itemprop="location" itemscope itemtype="http://data-vocabulary.org/​Organization">
										@ <a href="$Link" ><span itemprop="name">$Title</span></a>
										</span>
							</li>
						<% end_control %>
						</ul>
					<% end_if %>
				</div>
					<ul class="dates">
						<% control Event.DateAndTime %>
							<li> <a href="{$BaseHref}events/view/$StartDate.Format(Ymd)" class="date-link"><time itemprop="startDate" datetime="$StartDate.format(c)">$StartDate.format(M). $StartDate.format(j)</time> </a> <% if StartTime %>
								at $StartTime.Nice
								<% end_if %>
							
								<% if EndDate %>
								- <a href="{$BaseHref}events/view/$EndDate.Format(Ymd)" class="date-link"> <time itemprop="endDate" datetime="$EndDate.format(c)">$EndDate.format(M). $EndDate.format(j)</time> </a>
								<% end_if %>
						
							</li>
						<% end_control %>
					</ul><!-- end dates -->
					
		<div class="event-content">
			<div class="event-desc">
			
			<% control Event %>
			<p>$Content.Summary(40) <a href="$Link" class="read-more-link">read more</a></p>
			<% end_control %>
	<!--<a href="#" class="more-event-info">get directions</a>-->


			</div><!-- end event-desc -->

	

			<div style="clear: both;"></div>

		</div><!-- end event-content -->					
								
				<div style="clear: both"></div>

			</div><!-- end event-meta -->


		<div style="clear: both"></div>

		

	
	</div><!-- end event -->
