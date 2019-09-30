 <div class="card" itemscope itemtype="http://data-vocabulary.org/Event">
		<a href="$Link"><img  class="card-img-top" src="$Image.URL" /></a>
			<h3 class="card-title">
				<a class="card-title" href="$Link" itemprop="url">
					<span itemprop="summary">$Title</span><% if Event.CancelReason %>
					<p>
						Note: $CancelReason</p><% end_if %>
				</a>
			</h3>
			<% if Eventtypes %>
				<% loop Eventtypes.First %>
					<a class="card-title" href="$Link">$Title</a>
				<% end_loop %>
			<% end_if %>
			
			
		
			<div class="card-text"><% include EventCardDatesTimes %>$SummaryContent.Summary(30) <a href="$Link">Continue reading</a></div>

</div>