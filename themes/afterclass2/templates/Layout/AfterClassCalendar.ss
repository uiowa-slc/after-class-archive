<div id="left-column">
	<% if action = view %>
	
	<% else %>
		<!--<span class="featured">featured events</span>-->
		<% if FeaturedEvents %>
		
			<% control FeaturedEvents.First %>
				<% control Event %>
					<% include HomeFeature %>	
				<% end_control %>		
			<% end_control %>
		<% else %>
			<% control AllEvents.First %>
				<% control Event %>
					<% if CancelReason %>
			
					<% else %>
						<% include HomeFeature %>
					<% end_if %>
				<% end_control %>
			<% end_control %>
		<% end_if %> <!-- end if featured events -->
		
		
	<% end_if %> <!-- end if action = view -->
	<div style="clear: both"></div>

<div id="homepage-event-list">
	<h2><img src="{$ThemeDir}/images/happening_next.png" alt="happening next" /></h2>
	
	<% control AllEvents %>
	<div class="homepage-event $EvenOdd $FirstLast <% if Event.CancelReason %>canceled<% end_if %>">
	
		<div class="homepage-event-header">
			<h3><a href="$Event.Link">$Event.Title <% if Event.CancelReason %><span>Note: $Event.CancelReason</span><% end_if %></a></h3><% control Event.Eventtypes %><a class="event-header-category" href="$Link">$Title</a><% end_control %>
			
			<div style="clear: both"></div>
		
		</div>
						<div style="clear: both"></div>

		
		<div class="homepage-event-content">
			<div class="homepage-event-image">
					
					<a href="$Link">
					<% control Event %>
					$Image.CroppedImage(153,153)
					<% end_control %>
					</a>
					
					<div><a href="$Event.Link" class="more-event-info"><img src="{$ThemeDir}/images/view_event.png" /></a></div>

			</div><!-- end homepage-event-image -->

			<div class="homepage-event-desc">
			
			<% control Event %>
			<p>$Content.Summary(40) <a href="$Link" class="read-more-link">read more</a></p>
			<% end_control %>
	<!--<a href="#" class="more-event-info">get directions</a>-->

				<div class="homepage-event-meta">
				
				<div class="when">
					<!--<h4>date(s)</h4>-->
					
					
					<ul class="dates">
					
					
					<% control Event.DateAndTime %>
						<li> <a href="{$BaseHref}events/view/$StartDate.Format(Ymd)" class="date-link">$StartDate.format(M). $StartDate.format(j) </a> <% if StartTime %>
							at $StartTime.Nice
							<% end_if %>
						
							<% if EndDate %>
							- <a href="{$BaseHref}events/view/$EndDate.Format(Ymd)" class="date-link"> $EndDate.format(M). $EndDate.format(j) </a>
							<% end_if %>
					
						</li>
						<% end_control %>


					</ul>
				</div>

				
				<div class="where">
				
					<% if Event.Venues %>
						<ul>
						<% control Event.Venues %>
							<li>@ <a href="$Link">$Title</a></li>
						<% end_control %>
						</ul>
					<% end_if %>
				</div>
				
								
		
				
				<div style="clear: both"></div>
			</div><!-- end homepage-event-meta -->
			</div><!-- end homepage-event-desc -->

				<!--<div class="tags-container">
				<h4>tagged as</h4>
				<ul class="tags">
            		<% control Event %>
            		
            			<% control AllCategories %>
            				<li><a href="$Link">$Title</a><% if Last %><% else %>, <% end_if %></li>
            			<% end_control %>
            		<% end_control %>
				
				</ul>
				</div>-->
				

		<div style="clear: both;"></div>

		</div><!-- end homepage-event-content -->
	
	</div><!-- end homepage-event -->
	<% end_control %> <%-- end control Upcoming Events --%>

</div><!-- end homepage-event-list -->


</div><!-- end left-column -->


<div id="right-column">
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
</div><!-- end mc_embed_signup -->
<iframe src="//www.facebook.com/plugins/likebox.php?href=https%3A%2F%2Fwww.facebook.com%2Fpages%2FAfter-Class%2F319621914746674&amp;width=370&amp;height=258&amp;colorscheme=dark&amp;show_faces=true&amp;border_color=%23444&amp;stream=false&amp;header=false&amp;appId=242901859120617" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:370px; height:258px; background: #292929;" allowTransparency="true" class="facebook-iframe"></iframe>
	</div><!-- end newsletter-signup -->
	
	<div id="approaching-deadlines">
		<h2><img src="{$ThemeDir}/images/approaching_deadlines2.png" alt="Approaching Deadlines" /></h2>
		
		<div id="deadlines-container">
			<ul id="deadlines">
				<li class="odd"><strong>March 13</strong> - Deadline for intramural sports signup</li>
				<li class="even"><strong>March 18</strong> - Must turn in some rec services thing</li>
			</ul>
		
		</div>
	
	</div><!-- end approaching-deadlines -->
	<div id="the-dome">
		<h2><a href="http://imu.uiowa.edu/news"><img src="{$ThemeDir}/images/underthedome_test.png" alt="Under the Dome Student Blog" /></a></h2>
		<% control RSSDisplay(3, http://imu.uiowa.edu/news/feed/) %>
		<div class="blog-entry $EvenOdd">
			<h3><a href="$Link">$Title</a></h3>
			<div class="blog-posted-on">posted on $PublishedDate.NiceUS</div>
			<div class="blog-text">
			<p>$Content.Summary(50)</p>
			
			</div>
			<div class="read-more"><p><a href="$Link">Read More</a></p></div>
		
		</div><!-- end blog-entry -->
		<% end_control %>
	
	
	</div><!-- end the-dome -->
	

	
	<div id="categories">
		<h2><img src="{$ThemeDir}/images/categories.png" alt="Categories" /></h2>
		
		<ul class="category">
			<li>movies</li>
			<li>performing arts</li>
			<li>campus events</li>
			<li>wellness</li>
			<li>theatre</li>
			<li>concerts</li>
		
		
		</ul><!-- end category -->
	
	
	</div><!-- end categories -->
	
	<!--<div id="by-day">
		<h2><img src="{$ThemeDir}/images/by_day.png" /></h2>
		
		<div class="day">
			<h3>March 1</h3>
			<ul>
				<li>New Year's Eve</li>
				<li>Dancers in Company</li>
				<li>Eating Disorder Awareness Week</li>
			</ul>
		
		</div>
		
	
	</div>-->
	
</div><!-- end right-column -->

<div class="clear"></div>



