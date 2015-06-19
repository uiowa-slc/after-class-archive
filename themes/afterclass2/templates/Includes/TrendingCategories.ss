<% loop $FeaturedTrendingCategories %>
<div class="row">
	<div class="large-12 event-card-list-container columns $FirstLast">
		<h2>$Title</h2>
		<div class="event-card-slider loading">
			<% loop $EventList %>
				<div class="event-card"><% include EventCardSlider %></div>
			<% end_loop %>
		</div>
	</div>
</div>
<% end_loop %>