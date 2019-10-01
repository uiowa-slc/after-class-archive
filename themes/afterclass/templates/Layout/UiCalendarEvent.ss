<% include Header %>


<div class="container">
	<div class="row d-flex justify-content-center">
		<div class="col-lg-8" role="main">
			<article>

				<h1>$Title</h1>
				<div class="content">$Content</div>
				<% include EventCardDatesTimes %>
				<%--<% include MagnificExample %> -- %>
				<%-- <% include SlideshowExample %> --%>
				<%-- <% include ContentExample %> --%>
			</article>
			$Form
			$PageComments
		</div>
		<div class="col-lg-4">
			<img class="d-block" src="$Image.URL" />
		</div>
	</div>

</div>

