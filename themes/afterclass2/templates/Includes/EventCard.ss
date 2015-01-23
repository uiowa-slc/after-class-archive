<div class="event-card $EvenOdd $FirstLast <% if Event.CancelReason %>canceled<% end_if %>" itemscope itemtype="http://data-vocabulary.org/Event">
	<div class="event-card-header">
		<% if Eventtypes %>
			<% loop Eventtypes.First %>
				<a class="event-header-category button tag" href="$Link">$Title</a>
			<% end_loop %>
		<% end_if %>
	</div>
	<a href="$Link">
		<div class="event-card-image b-lazy" data-src="$Image.URL" style="background-image: data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">				
		</div><!-- end event-card-image -->
	</a>
	<div class="event-card-content">
		<h3>
			<a href="$Link">
				<span>$Title.LimitCharacters(40)</span><% if Event.CancelReason %>
				<div class="homepage-cancel-reason">
					Note: $Event.CancelReason</div><% end_if %>
			</a>
		</h3>
		<% include EventCardDatesTimes %>
		<div class="event-card-desc show-for-small-only">
			<p>$SummaryContent.Summary(30) <a href="$Link">Continue reading</a></p>

		</div>
	</div>
</div>

