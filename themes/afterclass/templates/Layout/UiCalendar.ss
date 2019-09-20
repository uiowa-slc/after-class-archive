<% include Header %>


<div class="container-fluid">
	<div class="row">
		<div class=" col-lg-12 content-container" role="main">
			<article>
				<h1>$Title</h1>
				<div class="content">$Content</div>
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

