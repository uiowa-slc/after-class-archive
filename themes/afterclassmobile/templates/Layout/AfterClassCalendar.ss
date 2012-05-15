<% require css(event_calendar/css/calendar.css) %>
<% require javascript(event_calendar/javascript/calendar_core.js) %>
<div id="left-column">
	<% if action = view %>
	<h1 class="date-header">Events for $DateHeader</h1>
	
		<% if Events %>
		
		<% else %>
		
		<p class="homepage-message">No events currently listed on this date. <a href="{$BaseHref}">Return home</a>, or check our <a href="{$BaseHref}events/category/">categories</a>, <a href="{$BaseHref}events/venue">venues</a>, and <a href="{$BaseHref}events/sponsor/">sponsors</a> for full event listings.</p>
		
		<% end_if %>
		
	<% else %>

		 
	<% end_if %> <!-- end if action = view -->
	<div style="clear: both"></div>

<div id="event-list">
	<h2>Happening Next</h2>

	<% cached if Home %>
	<% control AllEvents %>
		<% include Event %>
	<% end_control %>
	<% end_cached %>
	
</div><!-- end event-list -->


</div><!-- end left-column -->


<div id="right-column">
	<div id="calendar-filter-form">
		$CalendarWidget
	</div>
<!--<iframe src="//www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fuiowa.imu&amp;width=370&amp;height=258&amp;colorscheme=dark&amp;show_faces=true&amp;border_color=%23444&amp;stream=false&amp;header=false&amp;appId=242901859120617" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:370px; height:258px; background: #292929;" allowTransparency="true" class="facebook-iframe"></iframe>-->

	<div id="newsletter-signup">
		<h2>Stay Connected With Our Newsletter</h2>
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
</div><!-- end mc_embed_signup -->
	</div><!-- end newsletter-signup -->
	
	
	<div id="the-dome">
		<h2><a href="http://imu.uiowa.edu/news"><img src="{$ThemeDir}/images/underthedome.png" alt="Under the Dome" /></a></h2>
		
		<div class="blog-entries">
		<% control RSSDisplay(3, http://imu.uiowa.edu/news/feed/) %>
		<div class="blog-entry $EvenOdd">
			<h3><a href="$Link">$Title</a></h3>
			<div class="blog-posted-on">posted on $PublishedDate.Format(n/j/y)</div>
			<div class="blog-text">
			<p>$Content.Summary(50)</p>
			
			</div>
			<div class="read-more"><p><a href="$Link">Read More</a></p></div>
		
		</div><!-- end blog-entry -->
		<% end_control %>
		</div><!-- end blog-entries -->
	</div><!-- end the-dome -->


	<% cached 'category-navigation', Aggregate(AfterClassEvent).Max(LastEdited) %>
	<div id="categories">
		<h2><img src="{$ThemeDir}/images/by_type.png" alt="By Type" /></h2>
		<div id="categories-container">
		<ul class="category">
		
			<% control getEventtypes %>
				<% if Events %>
					<li><h3><a href="events/categories/$Title">$Title ($Events.Count)</a></h3>
					
						<ul>
							<% control Events %>
								<li><a href="$Event.Link">$Event.Title</a></li>
							<% end_control %>
						
						</ul>
					
					
					</li>				
				<% end_if %>
			
			
			
			<% end_control %>
		
		
		</ul><!-- end category -->
	</div><!-- end categories-container -->
	
	</div><!-- end categories -->
	<% end_cached %>
	
</div><!-- end right-column -->

<div class="clear"></div>


