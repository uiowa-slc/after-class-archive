<% include Header %>
<div class="container-fluid">
	<div class="calendar-content">
		$Content
	</div>

	<ul>
		<% loop $Children %>
			<li><a href="$Link">$ID: - Social link is $SocialLink ; Social type is: $SocialType</a></li>
		<% end_loop %>
	</ul>


	</div>
</div>
