<% include Header %>


<div class="container">
	<div class="row justify-content-center">
		<div class="col-sm col-lg-7 content-container pt-5" role="main">
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

		<% if Children %>
			<aside class="col-lg-3 mt-5" role="complementary">
				<% if $Menu(2) %>
					<nav class="secondary card">



					  <div class="card-header">
					    $Title
					  </div>
					  <ul class="list-group list-group-flush">
					  	<% with $Level(1) %>
					  		<% loop $children %>
					  			 <li class="list-group-item"><a href="$Link">$MenuTitle</a></li>
					  		<% end_loop %>

					  	<% end_with %>
					  </ul>
					</nav>
				<% end_if %>
			</aside>
		<% end_if %>
	</div>
</div>

