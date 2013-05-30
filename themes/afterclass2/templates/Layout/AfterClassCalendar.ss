

<% if FeaturedEvents %>
	<div class="flexslider">
		<div class="slides">
			
			<% control FeaturedEvents %>
				<div class="slide">
	
					<% include HeroEvent %>	
			
				</div>
			<% end_control %><!-- end control FeaturedEvents.First -->
			
		</div>
	</div>
		
		<% else %>
			<% control AllEvents.First %>
				<% control Event %>
					<% if CancelReason %>
					<% else %>
						<% include HeroEvent %>
					<% end_if %><!-- end if cancelreason -->
				<% end_control %>
			<% end_control %>
	<% end_if %> <!-- end if featured events -->

<div class="row">
<div id="left-column" class="span7">
<% if action = view %>
	<h1 class="date-header">Events for $DateHeader</h1>
	<% if Events %>
	<% else %>
		<p class="homepage-message">No events currently listed on this date. <a href="{$BaseHref}">Return home</a>, or check our <a href="{$BaseHref}events/category/">categories</a>, <a href="{$BaseHref}events/venue">venues</a>, and <a href="{$BaseHref}events/sponsor/">sponsors</a> for full event listings.</p>
	<% end_if %><!-- end if events -->
<% else %>

<% end_if %> <!-- end if action = view -->
<div style="clear: both"></div>
<div id="event-card-list">
	<h2>What's up next</h2>
	<div class="event-cards">
		<% control AllEvents %>
			<% control Event %>
				<% include EventCard %>
			<% end_control %>
		<% end_control %> <%-- end control Upcoming Events --%>
	</div> <!--end event-cards -->
	</div>
	<!-- end event-card-list -->
</div>
<!-- end left-column -->
<div id="right-column" class="span5">

<% cached 'future-deadlines', Aggregate(Deadline).Max(LastEdited) %>
		<% if FutureDeadlines %>
			<div id="approaching-deadlines">
				<h2><a href="{$BaseHref}deadlines/">Approaching Deadlines</a></h2>
				<div id="deadlines-container">
					<ul id="deadlines">
						<% control FutureDeadlines(10) %>
							<li class="$EvenOdd">
								<% if LinkURL %>
									<a href="$LinkURL" target="_blank>" class="external"><strong>$Date.Format(n/j/y)</strong> - $Title</a>
								<% else %>
									<a href="{$BaseHref}deadlines/"><strong>$Date.Format(n/j/y)</strong> - $Title</a>					
								<% end_if %>
							</li>
						<% end_control %>
					</ul>
					<ul id="additional-deadline-links">
						<li><a href="{$BaseHref}deadlines/">view all deadlines &raquo;</a></li>
						<li><a href="{$BaseHref}add/" target="_blank">submit an event &raquo;</a></li>
						<li><a href="http://www.registrar.uiowa.edu/calendars/fiveyearcalendar.aspx" target="_blank" class="external">academic calendar</a></li>
						<li><a href="http://www.hawkeyesports.com/calendar/events/" target="_blank" class="external" >athletic calendar</a></li>
		
					</ul>
				</div>
			</div>
			<!-- end approaching-deadlines -->
			<div class="clear"></div>
		<% end_if %>
	<% end_cached %>

	<div id="the-news">
		<h2><a href="http://imu.uiowa.edu/news">After Class: student news</a></h2>
		<div class="news-entries">
			<% control dynamicNews %>
				<div class="news-entry $EvenOdd">
					$Image
					<h3><a href="$Link">$Title</a></h3>
					<div class="news-posted-on">posted on $PublishedDate.Format(F n), $PublishedDate.Format(Y) by $Author</div>
					<div class="news-text">
						<p>$Content.Summary(50)</p>
					</div>
					<div class="read-more">
						<p><a href="$Link">Read More</a></p>
					</div>
				</div>
				<!-- end news-entry -->
			<% end_control %>
		</div>
		<!-- end news-entries -->
		<p class="view-all-posts-link"><a href="news/">view all posts &raquo;</a></p>
	</div>
	<!-- end the-news -->	
	<div id="facebook-like-box">
	<iframe src="//www.facebook.com/plugins/likebox.php?href=https%3A%2F%2Fwww.facebook.com%2Fuiowa.imu&amp;width=270&amp;height=600&amp;show_faces=true&amp;colorscheme=dark&amp;stream=true&amp;show_border=false&amp;header=false&amp;appId=584926258188205&border_color=%23444444" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:370px; height:600px;" allowTransparency="true"></iframe>
	</div>

		<% if Ad1Image %>
	<div id="ad1" class="homepage-ad">
		<% if Ad1URL %>
		<a href="$Ad1URL" target="_blank">
			<% control Ad1Image %>
				<% control SetWidth(368) %>
				<img src="$URL" alt="$Ad1Title" />
				<% end_control %>
			<% end_control %>
		</a>
		<% else %>
			<% control Ad1Image %>
				<% control SetWidth(368) %>
				<img src="$URL" alt="$Ad1Title" />
				<% end_control %>
			<% end_control %>
		<% end_if %>
	</div>
	<% end_if %>
	<% if Ad2Image %>
	<div id="ad2" class="homepage-ad">
		<% if Ad2URL %>
		<a href="$Ad2URL" target="_blank">
		
			<% control Ad2Image %>
				<% control SetWidth(368) %>
				<img src="$URL" alt="$Ad2Title" />
				<% end_control %>
			<% end_control %>			
			
		</a>
		<% else %>
			<% control Ad2Image %>
				<% control SetWidth(368) %>
				<img src="$URL" width="368" alt="$Ad2Title" />
				<% end_control %>
			<% end_control %>		
		<% end_if %>
	</div>
	<% end_if %>
	<% if Ad3Image %>
	<div id="ad3" class="homepage-ad">
		<% if Ad3URL %>
		<a href="$Ad3URL" target="_blank">

			<% control Ad3Image %>
				<% control SetWidth(368) %>
					<img src="$URL" width="368" alt="$Ad3Title" />
				<% end_control %>
			<% end_control %>			
			
		</a>
		<% else %>
			<% control Ad3Image %>
				<% control SetWidth(368) %>
					<img src="$URL" width="368" alt="$Ad3Title" />
				<% end_control %>
			<% end_control %>	
		<% end_if %>
	</div>
	<% end_if %>	
	<!-- categories -->
</div>
<!-- end right-column -->
</div><!-- end row -->
<div class="clear"></div>