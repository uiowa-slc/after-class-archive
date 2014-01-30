<section id="secondary_event_list">
	<% with/loopEvents %>
		<div class="secondary_event">
								
				<% with/loopEvent %>
					<a href="$Link">
					<% if Image %>
						<img src="$Image.MediumImage.URL"/>
					<% else %>
						<img src="$ThemeDir/images/placeholder_medium.png" />
					<% end_if %>
					<h2><strong>$Title</strong> <% if Venues %>@ <% with/loopVenues %>$Title<br/><% end_with/loop%><% end_if %></h2></a>
				<% end_with/loop%><!-- end control event -->
			</div>
	<% end_with/loop%><!-- end control events -->
</section>