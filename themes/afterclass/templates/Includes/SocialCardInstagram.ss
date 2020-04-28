<div class="social-card mb-3" itemscope="" itemtype="http://data-vocabulary.org/Event" style="position: relative;">
	<div class="social-card-body">
		<a href="$Link" <% if $LinkType == "external" %>target="_blank" rel="noopener"<% end_if %>><img class="d-block lazyload w-100" src="$SocialImageUrl" 
	data-aspectratio="1" style="border-radius: 4px;" alt="$SocialImageAlt"></a>
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
	
		<a href="$SocialAuthorUrl" class="social-card-sig" target="_blank" rel="noopener"><i aria-hidden="true" class="fab fa-instagram"></i> $SocialAuthorName <i aria-hidden="true" class="fa fa-external-link-alt" aria-hidden="true"></i></a>

</div>