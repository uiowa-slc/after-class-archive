<section id="secondary_event_list">
	<% loop Events %>
		<div class="secondary_event">
								
				<% loop Event %>
					<a href="$Link">
					<% if Image %>
						<img src="$Image.MediumImage.URL"/>
					<% else %>
						<img src="$ThemeDir/images/placeholder_medium.png" />
					<% end_if %>
					<h2><strong>$Title</strong> <% if Venues %>@ <% loop Venues %>$Title<br/><% end_loop %><% end_if %></h2></a>
				<% end_loop %><!-- end control event -->
			</div>
	<% end_loop %><!-- end control events -->
</section>