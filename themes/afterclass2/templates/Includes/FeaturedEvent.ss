<div class="feature-background-wrapper" style="background: url(/afterclass_dev/themes/afterclass2/images/home-feature-background.png); background-position: bottom; background-repeat: none;">
				<div class="homepage-feature" >
				
					<!--<img class="featured-logo" src="{$ThemeDir}/images/featured.png" />-->
					<h1><a href="$Link">$Title</a></h1>
					<div class="homepage-feature-details"> <a href="$Link">
						<% if Image %>
						$Image.CroppedImage(550,250)
						<% else %>
						<img src="$ThemeDir/images/placeholder.png" />
						<% end_if %>
						</a>
						
						<div style="clear:both"></div>

						<div class="home-feature-share">
						<!--<% include HomeFeatureDateBox %>-->
						</div><!-- end home-feature-share -->

					</div><!-- end homepage-feature-details -->
					<div class="homepage-feature-content">
					
						<div class="homepage-feature-text">
						<p>$Content.LimitSentences(3)</p>
						
							<div class="homepage-feature-specifics">
							
			
										
					
								<div class="homepage-feature-when">
								
									<% control DateAndTime %>
									<p> <a href="{$BaseHref}events/view/$StartDate.Format(Ymd)" class="date-link">$StartDate.format(F) $StartDate.format(j) </a>
										<% if EndDate %>
										- <a href="{$BaseHref}events/view/$EndDate.Format(Ymd)" class="date-link">$EndDate.format(F) $EndDate.format(j) </a>
										<% end_if %>
										<% if StartTime %>
										at $StartTime.Nice
										<% end_if %>
									</p>
									<% end_control %>
								</div><!-- end homepage-feature-when -->
								
								<div class="homepage-feature-where">
									<p>
									<% control Venues %>
									@ <a href="$Link">$Title</a>
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
						<% include ShareLinks %>
						<a class="more-event-info" href="$Link"><img src="{$ThemeDir}/images/view_event.png" alt="View Event" /></a>
					</div><!-- end homepage-feature-content -->
					<div style="clear: both"></div>

				</div><!-- end homepage-feature -->
				
			</div><!-- end feature-background-wrapper -->