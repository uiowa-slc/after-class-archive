<% include HeaderSmall %>

<div class="container">
	<div class="row justify-content-center">
		<div class="col-sm col-lg-9 col-xl-8 content-container pt-5" role="main">
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
            <% include SideBar %>
		<% end_if %>
	</div>
</div>

<% include InstaFeed %>

