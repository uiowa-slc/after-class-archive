<div class="feature-background-wrapper">
	<div class="hero-event homepage" itemscope itemtype="http://data-vocabulary.org/Event">	

			<div class="hero-event-image-container" style="background-image: url('<% if $ImageURL %>$ImageURL<% else %>{$ThemeDir}/images/placeholder.png<% end_if %>')">
						<a href="$Link" class="img-shadow">
			
						</a>
						<div class="clear"></div>
					</div>
					
					<div class="hero-event-content">
					<h1><a href="$Link" itemprop="url"><span itemprop="summary">$Title</span></a></h1>
					<div class="clear"></div>
					<div class="hero-event-details">
							<div class="hero-event-text">
								<p>$Content<a href="$Link">Continue reading</a></p>
							</div><!-- end hero-event-text-->
							<div class="hero-event-essential-text">						       
				            	<% if Cost %><p><strong>Price: </strong>$Cost</p><% end_if %>
							    <% if CancelReason %>
									<p><strong>Note: $CancelReason</strong></p>
								<% end_if %>
							</div>
								<%--<div class="hero-event-specifics">
									<div class="hero-event-when">
										<% include HeroDateTimes %>
									</div><!-- end hero-event-when -->
									
									<div class="hero-event-where">
										<% with Venue %>
											<p class="venues">
											<span itemprop="location" itemscope itemtype="http://data-vocabulary.org/​Organization">
											 <a href="$Link" class="button tag">@ <span itemprop="name">$Title</span></a>
											</span>
											</p>
										<% end_with %>
									</div><!-- end herp-event-where -->
									<div class="clear"></div>
									<% if MoreInfoLink %>
										<p><a href="$MoreInfoLink" class="button" target="_blank">More information</a></p>
									<% end_if %>
								</div><!-- end hero-event-specifics --> --%>
							</div><!-- end hero-event-details -->
							<% include AddThis %>
					
						<div class="clear"></div>	
					</div><!-- end hero-event-content -->
					<div style="clear: both"></div>
				</div><!-- end hero-event -->
			</div><!-- end feature-background-wrapper -->
