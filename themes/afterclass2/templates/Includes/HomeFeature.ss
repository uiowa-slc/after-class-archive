<div class="feature-background-wrapper">
	<div class="homepage-feature" itemscope itemtype="http://data-vocabulary.org/Event">				
					<!--<img class="featured-logo" src="{$ThemeDir}/images/featured.png" />-->
					<h1><a href="$Link" itemprop="url"><span itemprop="summary">$Title</span></a></h1>
					<% if Eventtypes %><% control Eventtypes.First %><a class="event-header-category" href="$Link">$Title</a><% end_control %><% end_if %>
					<div class="homepage-feature-details"> <a href="$Link">
						<% if Image %>
							<% control Image %>
								<img itemprop="photo" src="$URL" />
							<% end_control %>
						<% else %>
							<img itemprop="photo" src="$ThemeDir/images/placeholder.png" />
						<% end_if %>
						</a>
						
						<div style="clear:both"></div>

						<div class="home-feature-share">
						<!--<% include HomeFeatureDateBox %>-->
						</div><!-- end home-feature-share -->

					</div><!-- end homepage-feature-details -->
					<div class="homepage-feature-content">
					
						<div class="homepage-feature-text">
						<p>$getSummaryHTML(30) <a href="$Link">read more</a></p>
						
							<div class="homepage-feature-specifics">
							
			
										
					
								<div class="homepage-feature-when">
								
										<% control DateAndTimeLimited(3) %>
									<p> <a href="{$BaseHref}events/view/$StartDate.Format(Ymd)" class="date-link"><time itemprop="startDate" datetime="$StartDate.format(c)">$StartDate.format(F) $StartDate.format(j)</time></a>
										<% if EndDate %>
										until <a href="{$BaseHref}events/view/$EndDate.Format(Ymd)" class="date-link"><time itemprop="endDate" datetime="$EndDate.format(c)">$EndDate.format(F) $EndDate.format(j)</time></a>
										<% end_if %>
										<% if StartTime %>
										at $StartTime.Nice
										<% end_if %>
									</p>
									<% end_control %>
									
									
									<% if DateAndTimeMoreThan(3) %>
										<a href="$Link" class="more-dates-link">view more dates &raquo;</a>
									<% end_if %>
								</div><!-- end homepage-feature-when -->
								
								<div class="homepage-feature-where">
									<p>
									<% control Venues %>
										<p>
										<span itemprop="location" itemscope itemtype="http://data-vocabulary.org/​Organization">
										@ <a href="$Link"><span itemprop="name">$Title</span></a>
										</span>
										</p>
									<% end_control %>		
									</p>
											
									<% if Cost %>
										<p>Admission: <a href="$Link">$Cost </a></p>
									<% end_if %>
									
									
									
								</div>
								<div class="clear"></div>
							
								<!--<% include EventCategoryList %> -->
							</div><!-- end homepage-feature-specifics -->
						</div><!-- end homepage-feature-text -->
						
						<!--<h2>share</h2>-->
						 <div class="addthis_toolbox addthis_default_style"	addthis:url="{$AbsoluteLink}"
				addthis:title="{$Title}"
				addthis:description="">
    <a class="addthis_button_facebook_like"></a>
    <a class="addthis_button_twitter"></a>    
    <a class="addthis_button_google_plusone_share"></a>

    <a href="http://addthis.com/bookmark.php?v=250" class="addthis_button_compact"></a>

</div>
						<a class="more-event-info" href="$Link">view event</a>
					</div><!-- end homepage-feature-content -->
					<div style="clear: both"></div>

				</div><!-- end homepage-feature -->
				
			</div><!-- end feature-background-wrapper -->