<div class="feature-background-wrapper">
	<div class="hero-event homepage" itemscope itemtype="http://data-vocabulary.org/Event">	

					
					<div class="hero-event-content">
					<h1><a href="$Link" itemprop="url"><span itemprop="summary">$Title</span></a></h1>
					<div class="clear"></div>
					<div class="hero-event-details">
							<div class="hero-event-text">
							
								<p>$getSummaryHTML(30) <a href="$Link">read more</a></p>
				        
				            	$Cost
							    <% if CancelReason %>
									<p><strong>Note: $CancelReason</strong></p>
								<% end_if %>
							</div><!-- end hero-event-text-->
						
							
								<div class="hero-event-specifics">
									<div class="hero-event-when">
											<% control DateAndTimeLimited(3) %>
										<p class="$FirstLast"> <a href="{$BaseHref}events/view/$StartDate.Format(Ymd)" class="date-link"><time itemprop="startDate" datetime="$StartDate.format(c)">$StartDate.format(F) $StartDate.format(j)</time></a>
											<% if EndDate %>
											until <a href="{$BaseHref}events/view/$EndDate.Format(Ymd)" class="date-link"><time itemprop="endDate" datetime="$EndDate.format(c)">$EndDate.format(F) $EndDate.format(j)</time></a>
											<% end_if %>
											<% if StartTime %>
											at $StartTime.Nice
											<% end_if %>
										</p>
										<% end_control %>
										
										
										<% if DateAndTimeMoreThan(3) %>
											<a href="{$Link}#dates" class="more-dates-link">view more dates &raquo;</a>
										<% end_if %>
										
									</div><!-- end hero-event-when -->
									
									<div class="hero-event-where">
										<p>
										<% control Venues %>
											<p class="venues">
											<span itemprop="location" itemscope itemtype="http://data-vocabulary.org/​Organization">
											@ <a href="$Link"><span itemprop="name">$Title</span></a>
											</span>
											</p>
										<% end_control %>		
										</p>
												
										<% if Cost %>
											<p class="admission-price">Admission: <a href="$Link">$Cost </a></p>
										<% end_if %>	
									</div><!-- end herp-event-where -->
									<div class="clear"></div>
								
								
								</div><!-- end hero-event-specifics -->
							</div><!-- end hero-event-text -->
				
									
						 <div class="addthis_toolbox addthis_default_style"	addthis:url="{$AbsoluteLink}"
									addthis:title="{$Title}"
									addthis:description="">
							<a class="addthis_button_facebook_like"></a>
							<a class="addthis_button_twitter"></a>    
							<a class="addthis_button_google_plusone_share"></a>
							
							<a href="http://addthis.com/bookmark.php?v=250" class="addthis_button_compact"></a>
					
					    </div><!-- end addthis_toolbox -->
					    
					<div class="clear"></div>	


					</div><!-- end hero-event-content -->
				
					
					<div class="hero-event-image-container">
						<a href="$Link" class="img-shadow">
							<% if Image %>
								<% control Image %>
									<% control CroppedImage(730,462) %>
									<img itemprop="photo" src="$URL" />
									<% end_control %>
								<% end_control %>
							<% else %>
								<img itemprop="photo" src="$ThemeDir/images/placeholder.png" />
							<% end_if %>
						</a>
						<div class="clear"></div>
					</div>
					
				
				
					<div style="clear: both"></div>

				</div><!-- end hero-event -->
				
			</div><!-- end feature-background-wrapper -->