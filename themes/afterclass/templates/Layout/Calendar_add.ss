<% include HeaderSmall %>


<div class="container">
	<div class="row justify-content-center">
		<div class="col-sm col-lg-7 content-container pt-5" role="main">
			$Alert.RAW
			<article>
			<% with $Page("add") %>
			<h1>$Title</h1>
			<% end_with %>
			
			<div class="content">$SubmissionInfo.RAW</div>
			<div class="mb-3">
				$AddForm
			</div>

			<% with Page("add") %>
				$Content
			<% end_with %>
				
				
				
				<%--<% include MagnificExample %> -- %>
				<%-- <% include SlideshowExample %> --%>
				<%-- <% include ContentExample %> --%>
			</article>

			
			$PageComments

		</div>
	</div>
</div>

