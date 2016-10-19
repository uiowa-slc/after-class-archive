<div class="feature-background-wrapper">
	<div class="hero-event homepage" itemscope itemtype="http://data-vocabulary.org/Event">	

			<div class="hero-event-image-container" style="background-image: url('$Image.URL')">
						<a href="$Link" class="img-shadow"></a>
						<div class="clear"></div>
					</div>
					
					<div class="hero-event-content">
					<h1><a href="$Link" itemprop="url"><span itemprop="summary">$Title</span></a></h1>
					<div class="clear"></div>
					<div class="hero-event-details">
							<div class="hero-event-essential-text">						       
				            	<% if Cost %><p><strong>Price: </strong>$Cost</p><% end_if %>
							    <% if CancelReason %>
									<p><strong>Note: $CancelReason</strong></p>
								<% end_if %>
							</div>
								<div class="hero-event-specifics">
									<div class="hero-event-when">
										<% include HeroDateTimes %>
										<ul><li><a href="$CalendarLink" title="Save to iCal" target="_blank" download>Add this to calendar</a></li></ul>
									</div><!-- end hero-event-when -->
									
									<div class="hero-event-where">
				
											<p class="venues">
											<p><% if $Location %>{$Location} <% end_if %>
											<% if $Venue.Title %>
												<% with $Venue %>
													<% if $Link %>@ <a href="$Link" class="button tag">$Title</a>
													<% else %>
														@ $Title 
													<% end_if %>
												<% end_with %>
											<% end_if %>

												<a href="$Link" class="button" target="_blank">Event Details</a>
											</p>
									</div><!-- end hero-event-where -->
		
								</div><!-- end hero-event-specifics -->
							</div><!-- end hero-event-details -->
							<% include AddThis %>
					
						<div class="clear"></div>	
					</div><!-- end hero-event-content -->
					<div style="clear: both"></div>
				</div><!-- end hero-event -->
			</div><!-- end feature-background-wrapper -->
