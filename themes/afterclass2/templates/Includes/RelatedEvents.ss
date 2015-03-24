<section id="related-events" class="show-for-medium-up">
	<% if RelatedEvents %>
	<h2>Related Events</h2>
		<ul class="event-card-list">
			<% loop RelatedEvents.Limit(6) %>
				<li><% include EventCard %></li>
			<% end_loop %>
		</ul>
	<% end_if %>
</section>
