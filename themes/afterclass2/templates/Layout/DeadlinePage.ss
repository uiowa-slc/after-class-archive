<header id="secondary_header">
	<h1>Important Dates and Deadlines</h1>
</header>
<div id="single-page-content">

$Content
$Form

<% if AllDeadlines %>

	<% with/loopFutureDeadlines %>
	<div class="deadline">
		<h2>$Title</h2>
		<h3>Deadline: <span>$Date.NiceUS</span></h3>
		<p>$Description</p>
		<% if LinkURL %>
			<a href="$LinkURL">More information.</a>
		<% end_if %>
	</div>
	<% end_with/loop%>

<% else %>
<p>There aren't any deadlines currently listed right now.</p>

<% end_if %>


</div>
