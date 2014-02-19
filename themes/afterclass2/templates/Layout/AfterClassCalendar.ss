
<% if $action == "index" %>
	<% if FeaturedEvents %>
		<div class="flexslider">
			<div class="slides">
				<% loop FeaturedEvents %>
					<div class="slide">
						<% include HeroEvent %>	
					</div>
				<% end_loop %><!-- end control FeaturedEvents.First -->
			</div>
		</div>
	<% else %>
			<% loop Events.First %>
				<% loop Event %>
					<% if CancelReason %>
					<% else %>
						<% include HeroEvent %>
					<% end_if %><!-- end if cancelreason -->
				<% end_loop %>
			<% end_loop %>
	<% end_if %> <!-- end if featured events -->
<% end_if %>

<div class="row">
<div id="left-column" class="span7">
<% if $action != "index" %>
	<h1 class="date-header">Events for $DateHeader</h1>
	<% if not $Events %>
		<p class="homepage-message">No events currently listed on this date. <a href="{$BaseHref}">Return home</a>, or check our <a href="{$BaseHref}events/category/">categories</a>, <a href="{$BaseHref}events/venue">venues</a>, and <a href="{$BaseHref}events/sponsor/">sponsors</a> for full event listings.</p>
	<% end_if %><!-- end if events -->
<% end_if %>
<div style="clear: both"></div>
<div id="event-card-list">
	<% if $action == "index" %>
	<h2>What's up next</h2>
	<% end_if %>
	<div class="event-cards">
		<% loop AllEventsWithoutDuplicates %>
			<% with Event %>
				<% include EventCard %>
			<% end_with %>
		<% end_loop %> <%-- end control Upcoming Events --%>
	</div> <!--end event-cards -->
	</div>
	<!-- end event-card-list -->
</div>
<!-- end left-column -->
<div id="right-column" class="span5">


	<div id="the-news">
		<h2><a href="http://imu.uiowa.edu/news">After Class: student news</a></h2>
		<div class="news-entries">
			<% loop dynamicNews %>
				<div class="news-entry $EvenOdd">
					$Smallimage
					<h3><a href="$Link">$Title</a></h3>
					<div class="news-posted-on">posted on $Date.Format(F n), $Date.Format(Y) by $Author</div>
					<div class="news-text">
						<p>$Description.Summary(50)</p>
					</div>
					<div class="read-more">
						<p><a href="$Link">Read More</a></p>
					</div>
				</div>
				<!-- end news-entry -->
			<% end_loop %>
		</div>
		<!-- end news-entries -->
		<p class="view-all-posts-link"><a href="news/">view all posts &raquo;</a></p>
	</div>
	<!-- end the-news -->	
	<div id="facebook-like-box">
	<iframe src="//www.facebook.com/plugins/likebox.php?href=https%3A%2F%2Fwww.facebook.com%2Fuistudentlife&amp;widthamp;height=600&amp;show_faces=true&amp;colorscheme=dark&amp;stream=true&amp;show_border=false&amp;header=false&amp;appId=584926258188205&border_color=%23444444" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:600px;" allowTransparency="true"></iframe>
	</div>

		<% if Ad1Image %>
	<div id="ad1" class="homepage-ad">
		<% if Ad1URL %>
		<a href="$Ad1URL" target="_blank">
			<% loop Ad1Image %>
				<% loop SetWidth(368) %>
				<img src="$URL" alt="$Ad1Title" />
				<% end_loop %>
			<% end_loop %>
		</a>
		<% else %>
			<% loop Ad1Image %>
				<% loop SetWidth(368) %>
				<img src="$URL" alt="$Ad1Title" />
				<% end_loop %>
			<% end_loop %>
		<% end_if %>
	</div>
	<% end_if %>
	<% if Ad2Image %>
	<div id="ad2" class="homepage-ad">
		<% if Ad2URL %>
		<a href="$Ad2URL" target="_blank">
		
			<% loop Ad2Image %>
				<% loop SetWidth(368) %>
				<img src="$URL" alt="$Ad2Title" />
				<% end_loop %>
			<% end_loop %>			
			
		</a>
		<% else %>
			<% loop Ad2Image %>
				<% loop SetWidth(368) %>
				<img src="$URL" width="368" alt="$Ad2Title" />
				<% end_loop %>
			<% end_loop %>		
		<% end_if %>
	</div>
	<% end_if %>
	<% if Ad3Image %>
	<div id="ad3" class="homepage-ad">
		<% if Ad3URL %>
		<a href="$Ad3URL" target="_blank">

			<% loop Ad3Image %>
				<% loop SetWidth(368) %>
					<img src="$URL" width="368" alt="$Ad3Title" />
				<% end_loop %>
			<% end_loop %>			
			
		</a>
		<% else %>
			<% loop Ad3Image %>
				<% loop SetWidth(368) %>
					<img src="$URL" width="368" alt="$Ad3Title" />
				<% end_loop %>
			<% end_loop %>	
		<% end_if %>
	</div>
	<% end_if %>	
	<!-- categories -->
</div>
<!-- end right-column -->
</div><!-- end row -->
<div class="clear"></div>