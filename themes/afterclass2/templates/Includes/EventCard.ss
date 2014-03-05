	<div class="event-card $EvenOdd $FirstLast <% if Event.CancelReason %>canceled<% end_if %> id-{$Event.ID}" itemscope itemtype="http://data-vocabulary.org/Event" onClick="location.href='$Link'">
		<div class="event-card-header">
			<h3 class="big-cell">
				<a href="$Link" itemprop="url">
					<span itemprop="summary">$Title.LimitCharacters(30)</span><% if Event.CancelReason %>
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
					<span>$Title.LimitCharacters(30)</span><% if Event.CancelReason %>
					<div class="homepage-cancel-reason">
						Note: $Event.CancelReason</d><% end_if %>
				</a>
			</h3>
			<% include EventCardDatesTimes %>
				<div class="event-card-desc">
					<p>$Content.Summary(30) <a href="$Link">Continue reading</a></p>
					<!-- end event-card-meta -->
				</div>
				<!-- end event-card-desc -->
				<div style="clear: both;"></div>
			</div>
			<!-- end event-card-content -->
		</div>
		<!-- end event-card -->