
<% if $action == "index" %>
<% include Header %>
<% else %>
<% include HeaderSmall %>
<% end_if %>


<div class="container-fluid content-container" id="content">
	<% if $action != "canceled" && $Content %>
	<div class="calendar-content">
		$Content
	</div>
	<% end_if %>



	<% if $action != "index" %>
		<h1 class="filter-header">$FilterHeader</h1>
	<% end_if %>
<% if $action == "index" %>

			<% if $CombinedEventList.Count > 0 %>
				<div class="masonry-grid">
					<% loop $CombinedEventList %>
                        <% if $ClassName == 'CalendarEvent' %>
                        <div class="card masonry-grid-item" itemscope itemtype="http://data-vocabulary.org/Event">
                            $SocialCardHTML("internal")
                        </div>
                        <% else_if $ClassName == 'UiCalendarEvent' %>
						  <% include EventCard %>
                        <% end_if %>
					<% end_loop %> <%-- end loop Upcoming Events --%>
				</div>
			<% else %>
				<p class="text-center">There are currently no events listed on After Class. Please check back soon!</p>
			<% end_if %>

		<% else %>
			<% if $FilterEventList.Count > 0 %>
				<div class="masonry-grid">
					<% loop $FilterEventList %>
						<% include EventCard %>
					<% end_loop %> <%-- end loop Upcoming Events --%>
				</div>
			<% else %>
				<p class="text-center">There are currently no events listed in this category.</p>
			<% end_if %>
		<% end_if %>
	</div>
</div>
<% include InstaFeed %>
