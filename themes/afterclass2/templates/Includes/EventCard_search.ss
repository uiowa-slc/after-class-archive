	<div class="event-card $EvenOdd $FirstLast <% if Event.CancelReason %>canceled<% end_if %>" itemscope itemtype="http://data-vocabulary.org/Event" onClick="location.href='$LocalistLink'">
		<div class="event-card-header">
			<h3 class="big-cell">
				<a href="$LocalistLink" target="_blank" itemprop="url">
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
				<div class="event-card-image" style="background-image: url('$Image.URL')">
					<a href="$LocalistLink" target="_blank">

					</a>
				</div><!-- end event-card-image -->
			<div class="event-card-content">
			<h3 class="small-cell">
				<a href="$LocalistLink" target="_blank">
					<span>$Title.LimitCharacters(40)</span>
				</a>
			</h3>
			<p class="dates-times">
				<% if $Dates %>
					<% loop $Dates.Limit(1) %>
						<a href="{$Link}" class="date-link"><time itemprop="startDate" datetime="$Format(c)" class="$FirstLast">$Format(M) $Format(j)</time></a>
					<% end_loop %>
				<% end_if %>
				<% if Location %>{$Location}<% end_if %>
				
				<% if $Venue %>
					<% with $Venue %>
						<span> @ </span>
							<span itemprop="location" itemscope itemtype="http://data-vocabulary.org/​Organization">
						<a href="$LocalistLink" class="tag button" ><span itemprop="name">$Title.LimitCharacters(25)</span></a>
					</span>	
					<% end_with %>
				<% end_if %>	
				<% if $Dates.Count > "1" %>
					<a href="$LocalistLink" class="button more-dates">more dates</a> 
				<% end_if %> 
			</p>


				<div class="event-card-desc">
					<p>$Content.Summary(30) <a href="$LocalistLink" target="_blank">Continue reading</a></p>
					<!-- end event-card-meta -->
				</div>
				<!-- end event-card-desc -->
				<div style="clear: both;"></div>
			</div>
			<!-- end event-card-content -->
		</div>
		<!-- end event-card -->