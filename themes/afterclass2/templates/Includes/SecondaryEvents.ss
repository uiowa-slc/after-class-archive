<section id="secondary_event_list">
	<% control Events %>
		<div class="secondary_event">
		
				<div class="event_date_tag">
					<a href="$Link">
						<div class="event_date_box">
							$StartDate.format(M) <strong>$StartDate.format(j)</strong> $StartDate.format(D)
						</div>
					</a>
				</div>
								
				<% control Event %>
					<a href="$Link">
					<% if Image %>
						<img src="$Image.MediumImage.URL"/>
					<% else %>
						<img src="$ThemeDir/images/placeholder_medium.png" />
					<% end_if %>
					<h2><strong>$Title</strong> <% if Venues %>@ <% control Venues %>$Title<br/><% end_control %><% end_if %></h2></a>
				<% end_control %><!-- end control event -->
			</div>
	<% end_control %><!-- end control events -->
</section>