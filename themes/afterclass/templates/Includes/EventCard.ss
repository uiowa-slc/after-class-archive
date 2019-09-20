 <div class="card" itemscope itemtype="http://data-vocabulary.org/Event">
		<a href="$Link"><img  class="card-img-top" src="$Image.URL" /></a>
			<h3>
				<a href="$Link" itemprop="url">
					<span itemprop="summary">$Title.LimitCharacters(40)</span><% if Event.CancelReason %>
					<p>
						Note: $CancelReason</p><% end_if %>
				</a>
			</h3>
			<% if Eventtypes %>
				<% loop Eventtypes.First %>
					<a href="$Link">$Title</a>
				<% end_loop %>
			<% end_if %>
			
			<% include EventCardDatesTimes %>
		
			<p>$SummaryContent.Summary(30) <a href="$Link">Continue reading</a></p>

</div>