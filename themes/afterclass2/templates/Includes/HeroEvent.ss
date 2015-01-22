	<div class="hero-event homepage" itemscope itemtype="http://data-vocabulary.org/Event">	
		<div class="hero-event-image-container" style="background-image: url('$Image.URL')">
			<a href="$Link" class="img-shadow"></a>
			<div class="clear"></div>
			<a href="$Link" itemprop="url">
				<div class="hero-event-content">
					<h1><span itemprop="summary">$Title <br />
					<small>
						<% loop $Dates.Limit(1) %>
							<% with $StartDateTime %>
									<time itemprop="startDate" datetime="$Format(c)">
										$Format(D) $Format(M) $Format(j)
									</time>
							<% end_with %>
							<% if $EndDate %>
								-
								<% with $EndDate %>
									<time itemprop="endDate" datetime="$Format(c)">
										$Format(D) $Format(M) $Format(j)
									</time>
								<% end_with %>
							<% end_if %>
						<% end_loop %>
					</small></span></h1>
				</div><!-- end hero-event-content -->
			</a>
		</div>

	</div><!-- end hero-event -->
