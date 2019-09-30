<% include Header %>


<div class="container-fluid page__background">
	<div class="row">
		<div class=" col-lg-12 content-container title__container" role="main">

			<div class="header-graphic"><img class="header-graphic__img" src="$ThemeDir/dist/images/header1.jpg"></div>
			<article>
				<%-- <h1 class="calendar__title">$Title</h1>
				<div class="content calendar__title">$Content</div> --%>
				<%--<% include MagnificExample %> -- %>
				<%-- <% include SlideshowExample %> --%>
				<%-- <% include ContentExample %> --%>
			</article>
			$Form
			$PageComments
		</div>
	</div>


	<div class="card-columns">
		<% if $action == "index" %>
		<% loop $EventList("threemonths") %>
			<% include EventCard %>
		<% end_loop %> <%-- end loop Upcoming Events --%>
		<% else %>
		<% loop $FilterEventList %>
			<% include EventCard %>
		<% end_loop %> <%-- end loop Upcoming Events --%>
		<% end_if %>


	</div>
</div>

