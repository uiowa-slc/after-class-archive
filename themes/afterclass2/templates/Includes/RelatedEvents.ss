<section id="related-events" class="show-for-medium-up">
	<% if RelatedEvents %>
	<h2>Related Events</h2>
		<% loop RelatedEvents %>
			<% include EventCard %>
		<% end_loop %>
	<% end_if %>

</section>
