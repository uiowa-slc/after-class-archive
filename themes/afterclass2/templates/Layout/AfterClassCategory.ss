<header id="secondary_header">
 	<h1>$Category.Title</h1>
</header>


 <div id="single-page-content">
 			
 			<div class="about-category">
 			<p>$Category.Information</p>
 			<% if LinkURL %><p><a href="$LinkURL">Visit Website</a></p><% end_if %>
 			
 			</div>
 		
		

 	
		
		
		<% control Category %>
		
		<% if ClassName = Sponsor %>
 			<h2>Current events sponsored by $Title:</h2>
 		<% else_if ClassName = Venue %>
 			<h2>Current events at $Title:</h2>
 		<% else_if ClassName = Eventtype %>
 		
 		<% end_if %>	
		
		

		<div class="category-list">
		<!--<% control Events(2) %><div><% control Event %>$Title<% end_control %></div><% end_control %>-->
		<% if Events %>
		<ul class="category-list-events">
			<% control Events %><li>
			<% control Event %>
			<a href="$Link"><img src="$Image.SmallImage.URL"></a>
			<div class="info">
			<a href="$Link"><strong>$Title</strong></a><br />
			<% end_control %>
			$StartDate.format(M j)<% if EndDate %> - $EndDate.format(M j)<% end_if %>
			</div>
			</li><% end_control %>
		</ul>
		<div style="clear: both"></div>
		<!--<div class="view-all"><a href="{$BaseHref}events/categories/$Title">View All $Events.count Events</a></div>-->

			 <!--<a href="{$BaseHref}events/categories/$Title">View all $Events.count events</a>.-->
		<% else %>
			No events currently listed.
		<% end_if %>
	</div>
 </div>
<% end_control %>
	
<style type="text/css">
.category-list>li{
	width: 100%;
}
.category-list ul {
	margin: 0px;
	padding: 0px;
}
.category-list ul li {
	border: 1px solid #ccc;
	list-style-type: none;
	float: left;
	margin: 0px 15px 20px 0px;
	padding: 10px;
	width: 430px;
	min-height: 150px;
}
.category-list ul li img {
	float: right;
	border: 1px solid #ccc;
}
.category-list ul li .info {
}
.category-list ul li .info strong {
	color: #2488A3;
	font-family: 'Doppio One', monospace;
	font-size: 22px;
	font-weight: normal;
	text-transform: capitalize;
	padding-bottom: 10px;
	border-bottom: 1px solid #ccc;
	margin-bottom: 10px;
	display: block;
	width: 280px;
	
}
.category-list .view-all {
	clear: left;
	float: right;
	font-size: 12px;
	color: #555;
}
.category-list h2 span a {
	font-family: 'Open Sans', sans-serif;
	font-size: 13px;
	font-weight: normal;
}
</style>		
