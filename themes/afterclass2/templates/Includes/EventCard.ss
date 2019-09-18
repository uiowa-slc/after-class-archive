	<div class="event-card $EvenOdd $FirstLast <% if Event.CancelReason %>canceled<% end_if %>" itemscope itemtype="http://data-vocabulary.org/Event">

		<div class="event-card-header">
			<h3 class="big-cell">
				<a href="$Link" itemprop="url">
					<span itemprop="summary">$Title.LimitCharacters(40)</span><% if Event.CancelReason %>
					<div class="homepage-cancel-reason">
						Note: $CancelReason</d><% end_if %>
				</a>
			</h3>
			<% if Eventtypes %>
				<% loop Eventtypes.First %>
					<a class="event-header-category button tag" href="$Link">$Title</a>
				<% end_loop %>
			<% end_if %>
			<div style="clear: both"></div>
			</div>
			<div style="clear: both"></div>

				<a href="$Link"><div class="event-card-image b-lazy" data-src="" src="{$ThemeDir}/images/placeholder.jpg" style="background-image: url({$ThemeDir}/images/placeholder.jpg)" item>
					

					
				</div><!-- end event-card-image --></a>
			<div class="event-card-content">
			<h3 class="small-cell">
				<a href="$Link">
					<span>$Title.LimitCharacters(40)</span><% if Event.CancelReason %>
					<div class="homepage-cancel-reason">
						Note: $Event.CancelReason</d><% end_if %>
				</a>
			</h3>
			<% include EventCardDatesTimes %>
				<div class="event-card-desc">
					<p>$SummaryContent.Summary(30) <a href="$Link">Continue reading</a></p>
					<!-- end event-card-meta -->
				</div>
				<!-- end event-card-desc -->
				<div style="clear: both;"></div>
			</div>
			<!-- end event-card-content -->
		</div>
		<!-- end event-card -->