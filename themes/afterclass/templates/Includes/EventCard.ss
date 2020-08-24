<div class="card masonry-grid-item" itemscope itemtype="http://data-vocabulary.org/Event">
    <% if $IsLateNight %>
 		<img class="card__banner-img" alt="Late Night Programs Flag" role="presentation" src="$ThemeDir/dist/images/latenightbanner.png" />
 	<% end_if %>
	<% if $Image.URL %>
	   <a href="$Link"><img class="card-img-top lazyload" data-src="$Image.ThumbURL" data-aspectratio="$Image.Ratio"  /></a>
	<% end_if %>
	<div class="card-body">
		<h3 class="card-title">
			<a href="$Link" itemprop="url">
				<span itemprop="summary">$Title</span>
			</a>
		</h3>
		<% if Eventtypes %>
			<% loop Eventtypes.First %>
				<a class="card-title" href="$Link">$Title</a>
			<% end_loop %>
		<% end_if %>

		<div class="card-text"><% include EventCardDatesTimes %>$SummaryContent.Summary(30)</div>
	</div>
</div>
