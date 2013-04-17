

<% if FeaturedEvents %>
		<% control FeaturedEvents.First %>
			<% control Event %>
				<% include HeroEvent %>	
			<% end_control %><!-- end control Event -->		
		<% end_control %><!-- end control FeaturedEvents.First -->
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


<div id="left-column">
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
	<h2><img src="{$ThemeDir}/images/events.png" alt="Events" /></h2>
	<% control AllEvents %>
		<% control Event %>
			<% include EventCard %>
		<% end_control %>
		<% end_control %> <%-- end control Upcoming Events --%>
	</div>
	<!-- end event-card-list -->
</div>
<!-- end left-column -->
<div id="right-column">
	<div id="the-news">
		<h2><a href="http://imu.uiowa.edu/news"><img src="{$ThemeDir}/images/news.png" alt="After Class News" /></a></h2>
		<div class="news-entries">
			<% control RSSDisplay(3, http://afterclass.uiowa.edu/news/feed/) %>
				<div class="news-entry $EvenOdd">
					$Image
					<h3><a href="$Link">$Title</a></h3>
					<div class="news-posted-on">posted on $PublishedDate.Format(n/j/y)</div>
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

	<iframe src="//www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fuiowa.imu&amp;width=370&amp;height=258&amp;colorscheme=dark&amp;show_faces=true&amp;border_color=%23444&amp;stream=false&amp;header=false&amp;appId=242901859120617" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width: 100%; height:258px; background: #292929;" allowTransparency="true" class="facebook-iframe"></iframe>
	<div id="newsletter-signup">
		<h2><img src="{$ThemeDir}/images/stay_connected.png" alt="Stay Connected With Our Newsletter" /></h2>
		<p>sign up for our newsletter to see what's happening around campus. you also might win something.</p>
		<div id="mc_embed_signup">
			<form action="http://uiowa.us2.list-manage.com/subscribe/post?u=c61b1cddac92babd42d7d628e&amp;id=8e3635391c" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank">
				<fieldset>
					<div id="mce-responses" class="newsletter-responses">
						<div class="response" id="mce-error-response" style="display:none"></div>
						<div class="response" id="mce-success-response" style="display:none"></div>
					</div>
					<div class="mc-field-group" class="newsletter-inputs">
						<input type="text" value="" name="EMAIL" class="required email" id="mce-EMAIL" placeholder="Email address..." />
						<input type="submit" value="Sign Up" name="subscribe" id="mc-embedded-subscribe" class="btn" />
					</div>
				</fieldset>
			</form>
		</div>
		<!-- end mc_embed_signup -->
	</div>
	<!-- end newsletter-signup -->

	<% cached 'future-deadlines', Aggregate(Deadline).Max(LastEdited) %>
		<% if FutureDeadlines %>
			<div id="approaching-deadlines">
				<h2><a href="{$BaseHref}deadlines/"><img src="{$ThemeDir}/images/approaching_deadlines2.png" alt="Approaching Deadlines" /></a></h2>
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
						<li><a href="http://www.registrar.uiowa.edu/calendars/fiveyearcalendar.aspx" target="_blank">academic calendar &raquo;</a></li>
						<li><a href="http://www.hawkeyesports.com/calendar/events/" target="_blank" >athletic calendar &raquo;</a></li>
						<li><a href="{$BaseHref}add/" target="_blank" >submit an event &raquo;</a></li>
					</ul>
				</div>
			</div>
			<!-- end approaching-deadlines -->
			<div class="clear"></div>
		<% end_if %>
	<% end_cached %>
	<% if Ad1Image %>
	<p>test</p>
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
<div class="clear"></div>