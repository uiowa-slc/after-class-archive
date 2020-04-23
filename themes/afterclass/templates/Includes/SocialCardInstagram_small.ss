<div class="social-card mb-3" itemscope="" itemtype="http://data-vocabulary.org/Event">
	<div class="social-card-body">
		<a href="$Link" target="_blank" rel="noopener"><img class="d-block lazyload w-100" src="$SocialImageUrl" 
	data-aspectratio="1" style="border-radius: 4px;"></a>
<%-- 		<h3 class="social-card-title" style="font-size: 18px;">
			<a href="$Link" itemprop="url">
				<span itemprop="summary">$Title</span>
			</a>
		</h3> --%>
<%-- 		<div class="social-card-subtitle">
			<span>Date:</span>
			<% if $DateTimes %>
				<% loop $DateTimes %>
					<% include DateTimesList %>
				<% end_loop %>
			<% end_if %>
		</div> --%>
		<div class="social-card-text">

		<%-- 	$SocialCaption.Summary(30) --%>
		</div>
	</div>
	<div class="social-card-footer event-footer text-muted" style="margin-top: -30px; padding: 5px;">
		<a href="$SocialAuthorUrl" style="background:#222; padding: 5px;"><i class="fab fa-instagram"></i> $SocialAuthorName</a>
	</div>
</div>
