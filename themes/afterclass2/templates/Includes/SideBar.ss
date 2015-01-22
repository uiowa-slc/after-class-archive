<div class="sidebar">
	<div class="show-for-medium-up">
	<% include SecondaryNav %>
	</div>
		<div id="facebook-like-box">
			<iframe src="//www.facebook.com/plugins/likebox.php?href=https%3A%2F%2Fwww.facebook.com%2Fuistudentlife&amp;widthamp;height=230&amp;show_faces=true&amp;colorscheme=dark&amp;show_border=false&amp;header=false&amp;appId=584926258188205&border_color=%23444444" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:230px;" allowTransparency="true"></iframe>
		</div>
		<div id="the-news">
			<h2><a href="http://studentlife.uiowa.edu/news/" target="_blank">Student life at iowa</a></h2>
			<div class="news-entries">
				<% loop $RSSDisplay("5", "http://studentlife.uiowa.edu/news/rss/") %>
					<article class="news-entry $EvenOdd">
						<a href="$Link"><img src="$ThumbnailURL" /></a>
						<h3><a href="$Link" target="_blank">$Title</a></h3>
						<div class="news-text">
							<p>$Description.Summary(30) <a href="$Link">Continue Reading</a></p>
						</div>
					</article>
					<!-- end news-entry -->
				<% end_loop %>
			</div>
			<!-- end news-entries -->
			<p class="view-all-posts-link"><a href="http://studentlife.uiowa.edu/news/" target="_blank" class="button">view all posts</a></p>
		</div>
			<!-- end the-news -->	
			<!-- categories -->
</div>
