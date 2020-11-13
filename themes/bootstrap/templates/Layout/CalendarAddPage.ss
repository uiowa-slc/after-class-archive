<% include HeaderSmall %>

<div class="container content-container" id="alert">
	<div class="row justify-content-center">
		<div class="col-sm col-lg-8 col-xl-7 content-container pt-5" role="main">
			$Alert.RAW
			<article>
				<h1>$Title</h1>

				<% if $Calendar.ShowSocialCalendar %>
					<div class="content">$SubmissionInfo</div>
					<div class="mb-5">
						$AddForm
					</div>
				<% end_if %>

				$Content

			</article>
		</div>

			<% if $Calendar.SocialEventList && $Calendar.ShowSocialCalendar %>
				<div class="d-none d-lg-block col-lg-3 pt-5">
					<div class="sticky-side">
						<h2>Example post:</h2>
						<% loop $Calendar.SocialEventList(shuffled).First %>
							<div class="">
								$SocialCardHTML("internal")
							</div>
						<% end_loop %>
					</div>
				</div>
			<% end_if %>

	</div>
</div>

<% include InstaFeed %>
