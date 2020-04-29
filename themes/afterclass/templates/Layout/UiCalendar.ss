
<% if $action == "index" %>
<% include Header %>
<% else %>
<% include HeaderSmall %>
<% end_if %>


<div class="container-fluid">
	<% if $action != "canceled" && $Content %>
	<div class="calendar-content">
		$Content
	</div>
	<% end_if %>



	<% if $action != "index" %>
		<h1 class="filter-header">$FilterHeader</h1>
	<% end_if %>
<% if $action == "index" %>


		<% if $SocialEventList && $ShowSocialCalendar %>
			<section class="social-carousel__container">
				<h1 class="text-uppercase text-center" style="font-size: 22px; padding-top: 10px;">From social media:</h1>
				<div class="social-carousel">
					<% loop $SocialEventList(shuffled) %>
						<div class="carousel-cell carousel-cell--{$SocialType.Lowercase}">
							$SocialCardHTML("internal")
						</div>
					<% end_loop %>
				</div>
			</section>
		<% end_if %>

		<h1 class="filter-header">From the <a href="https://events.uiowa.edu" target="_blank" rel="noopener">UI Events Calendar <i aria-hidden="true" style="font-size: 32px;" class="fa fa-external-link-alt"></i></a></h1>
			<% if $EventList("threemonths").Count > 0 %>
				<div class="masonry-grid">
					<% loop $EventList("threemonths") %>
						<% include EventCard %>
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
