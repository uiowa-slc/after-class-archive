<section id="detail_related_events">
	<% if RelatedEvents %>
	<h2>Related Events</h2>
	
	<% control RelatedEvents %>
	  <% control Event %>
	  <div class="related_event">
		<a href="$Link"><% if Image %><img src="$Image.SmallImage.URL"/><% else %><img src="$ThemeDir/images/placeholder_small.png" /> <% end_if %>
		<h3><strong>$Title</strong> <% if Venues %>@<% control Venues %> $Title <% end_control %><% end_if %></h3></a>
	  </div>
	  <% end_control %>
	<% end_control %>
	<% end_if %>

</section>