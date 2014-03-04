<div class="container-fluid">
<% include SecondaryNav %>
</div>
<div id="the-news">
	<h2><a href="news/">Student life at iowa</a></h2>
		<div class="news-entries">
			<% loop $RSSDisplay("5", "http://afterclass.uiowa.edu/news/feed/") %>
				<div class="news-entry $EvenOdd">
					$Smallimage
					<h3><a href="$Link">$Title</a></h3>
					<div class="news-posted-on">$Date.Format(F n), $Date.Format(Y) - $Author</div>
					<div class="news-text">
						<p>$Description.Summary(50) <a href="$Link">Continue Reading</a></p>
					</div>
				</div>
				<!-- end news-entry -->
			<% end_loop %>
		</div>
		<!-- end news-entries -->
		<p class="view-all-posts-link"><a href="news/" class="button">view all posts &raquo;</a></p>
	</div>
	<!-- end the-news -->	
	<div id="facebook-like-box">
	<iframe src="//www.facebook.com/plugins/likebox.php?href=https%3A%2F%2Fwww.facebook.com%2Fuistudentlife&amp;widthamp;height=600&amp;show_faces=true&amp;colorscheme=dark&amp;stream=true&amp;show_border=false&amp;header=false&amp;appId=584926258188205&border_color=%23444444" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:600px;" allowTransparency="true"></iframe>
	</div>
	<!-- categories -->