
<div class="show-for-medium-up">
<% include SecondaryNav %>
</div>
	<div id="the-news">
		<h2 class="upper"><a href="http://studentlife.uiowa.edu/news/" target="_blank">Student life at iowa</a></h2>
			<div class="news-entries">
				<% loop $RSSDisplay("5", "http://studentlife.uiowa.edu/news/rss") %>
					<div class="news-entry $EvenOdd">
						$Smallimage
						<h3><a href="$Link" target="_blank">$Title</a></h3>
						<p class="news-posted-on">$Date.Format(F n), $Date.Format(Y) <!--- by $Author ---></p>
						<div class="news-text">
							<p>$Description.Summary(50) <a href="$Link">Continue Reading</a></p>
						</div>
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