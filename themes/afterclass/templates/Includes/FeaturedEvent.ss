<section id="secondary_feature" class="feature clearfix">
						<a href="$Link">
							<% if Image %>
				    	   	<img src="$Image.LargeImage.URL" class="secondary_feature_image"/>
				    	   	<% else %>
				    	   	<img src="$ThemeDir/images/placeholder.png" class="secondary_feature_image" />
				    	   	<% end_if %>
				    	</a>
				    	   	<div class="event_group">
					    	   	<div class="event_text">
					    			<h2><a href="$Link">Featured Event <strong>$Title</strong></a></h2>
					    			<p class="event_details">
					    			
					    			<% control UpcomingDates %>
									<% if First %>
									<a href="{$BaseHref}events/view/$StartDate.Format(Ymd)">$StartDate.format(l), $StartDate.format(F) $StartDate.format(j)<br/>
					        		$StartTime.nice</a><br/>
					    			<% end_if %>
					    			<% end_control %>
					    			
					            	$Location<br/>
					            	$Cost</p>           
								</div>
					       	
					       		<div class="event_date_tag">
									<a href="{$BaseHref}events/view/$StartDate.Format(Ymd)">
										<% control UpcomingDates %>
											<% if First %>
												<div class="event_date_box">$StartDate.format(M) <strong>$StartDate.format(j)</strong>
													$StartDate.format(D)
												</div></a>
											<% end_if %><!-- end if first -->
							        	<% end_control %>
						        	</a>
						        	
						<% include ShareLinks %>
					        	</div><!-- /event_date_tag -->       
					        
					         	<p class="event_description">$Content</p>
					    
							</div><!-- /event_group -->
				    	</section>
