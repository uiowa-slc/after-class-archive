<div class="blog-card $EvenOdd $FirstLast <% if $MultipleOf(4) && not $First %>end-row<% end_if %>" itemscope itemtype="http://data-vocabulary.org/Event">
	<a href="$Link">
		<div class="blog-card-image b-lazy" data-src="$ThumbnailURL" style="background-image: data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">				
		</div><!-- end blog-card-image -->
	</a>
	<div class="blog-card-content">
		<h3>
			<a href="$Link">
				<span>$Title.LimitCharacters(40)</span>
			</a>
		</h3>
		<div class="blog-card-desc show-for-small-only">
			<p>$Description.Summary(30)  <a href="$Link">Continue reading</a></p>
		</div>
	</div>
</div>
