<% control Events.First %>
			<% control Event %>
			<% if CancelReason %>
			
			<% else %>
			<div class="feature-background-wrapper" style="background: url(/afterclass_dev/themes/afterclass2/images/home-feature-background.png); background-position: bottom; background-repeat: none;">
				<div class="homepage-feature" >
				
					<img class="featured-logo" src="{$ThemeDir}/images/featured.png" />
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
						<% include ShareLinks %>
						<!--<% include HomeFeatureDateBox %>-->
						</div><!-- end home-feature-share -->

					</div><!-- end homepage-feature-details -->
					<div class="homepage-feature-content">
					
						<div class="homepage-feature-text">
						<p>$Content.Summary(50)</p>
						<h2>where</h2>
						<p>
						<% control Venues %>
						$Title
						<% end_control %>
						</p>
						
								
						
						<% if Cost %>
						<p>Admission: $Cost</p>
						<% end_if %>
						
						<h2>when</h2>
						
						<% control DateAndTime %>
						<p> <a href="{$BaseHref}events/view/$StartDate.Format(Ymd)" class="date-link">$StartDate.format(l), $StartDate.format(M). $StartDate.format(j) </a>
							<% if EndDate %>
							- <a href="{$BaseHref}events/view/$EndDate.Format(Ymd)" class="date-link"> $EndDate.format(l), $EndDate.format(M). $EndDate.format(j) </a>
							<% end_if %>
							<% if StartTime %>
							at $StartTime.Nice
							<% end_if %>
						</p>
						<% end_control %>
						
						<% include EventCategoryList %>
						</div><!-- end homepage-feature-text -->
					</div><!-- end homepage-feature-content -->
					<div style="clear: both"></div>

				</div><!-- end homepage-feature -->
				
			</div><!-- end feature-background-wrapper -->
			<% end_control %>
			<!-- end control event -->
			
			<% end_if %><!-- end if cancel reason -->

