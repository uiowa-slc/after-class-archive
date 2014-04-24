<section id="related-events" class="hidden-phone hidden-tablet">
	<% if RelatedEvents %>
	<h2>Related Events</h2>
	
	<% loop RelatedEvents %>
	 <% include EventCard %>
	<% end_loop %>
	<% end_if %>

</section>
