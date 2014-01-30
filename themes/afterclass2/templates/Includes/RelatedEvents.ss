<section id="detail_related_events">
	<% if RelatedEvents %>
	<h2>Related Events</h2>
	
	<% loop RelatedEvents %>
	  <div class="related_event">
	  <% loop Event %>
		<a href="$Link"><% if Image %><img src="$Image.SmallImage.URL"/><% else %><img src="$ThemeDir/images/placeholder_small.png" /> <% end_if %>
		<h3><strong>$Title</strong> <% if Venues %>@<% loop Venues %> $Title <% end_loop %><% end_if %></h3></a>
	  <% end_loop %>
		<!--$StartDate.Format(l), $StartDate.Month $StartDate.DayOfMonth
		<% if EndDate %>
		 - $EndDate.Format(l), $EndDate.Month $EndDate.DayOfMonth<% end_if %> <br />-->
	  </div>
	<% end_loop %>
	<% end_if %>

</section>
<style type="text/css">
#detail_related_events .related_event {
  width: 200px;
  margin: 0px 12px 5px 12px;
}
#detail_related_events .related_event h3 {
margin: 5px 0px 0px 0px;
}
</style>