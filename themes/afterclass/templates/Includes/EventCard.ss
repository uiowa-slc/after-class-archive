
 <div class="card masonry-grid-item" itemscope itemtype="http://data-vocabulary.org/Event">
 	<% if $Dates.First.StartDateTime.Format(H) > 20 %>
 		<img class="card__banner-img" src="$ThemeDir/dist/images/latenightbanner.png" />
 	<% end_if %>
 	<%-- $Dates.First.StartDateTime.Format(H) --%>



<%--  		<% if $Image.URL %>
 		<div class="event-card-image-container">
			<a href="$Link"><img class="card-img-top lazyload" data-src="$Image.URL" /></a>
		</div>
		<% end_if %> --%>
 		<% if $Image.RectangleURL %>
 	
		<a href="$Link"><img class="card-img-top lazyload" data-src="$Image.RectangleURL" data-aspectratio="1.3333"  /></a>
		<% end_if %>
		<div class="card-body">

			<h3 class="card-title">
				<a href="$Link" itemprop="url">
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
			
			
		
			<div class="card-text"><% include EventCardDatesTimes %>$SummaryContent.Summary(30)</div>

			<a href="$Link" class="card-link">Continue Reading</a>
		</div>

</div>