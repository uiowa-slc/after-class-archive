
<div class="show-for-medium-up">
<% include SecondaryNav %>
</div>
	<div id="the-news">
		<h2 class="upper"><a href="http://studentlife.uiowa.edu/news/" target="_blank">Student life at iowa</a></h2>
			<div class="news-entries">
				<% loop $StudentLifeNews %>
					<div class="news-entry $EvenOdd">
						<a href="$CanonicalURL" class="news-entry__link">
						<img src="$FeaturedImageURL" class="news-entry__img" alt="" role="presentation" />
						<h3>$Title</h3>
						
						<div class="news-text">
							<p>$Content.Summary(50)</p>
						</div>
						<p class="news-posted-on">Posted $PublishDate.Format(MMM d, YYYY)<!--- by $Author ---></p>
						</a>
					</div>
					<!-- end news-entry -->
				<% end_loop %>
			</div>
			<!-- end news-entries -->
			<p class="view-all-posts-link"><a href="http://studentlife.uiowa.edu/news/" target="_blank" class="button">view all posts</a></p>
		</div>
		<!-- end the-news -->	
		<!-- categories -->
</div>