<?xml version="1.0"?>
<rss version="2.0" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:atom="http://www.w3.org/2005/Atom">
	<channel>
		<title>Upcoming Events for Happening Now</title>
		<link>http://afterclass.uiowa.edu/events/</link>
		<atom:link href="http://afterclass.uiowa.edu/events/" rel="self" type="application/rss+xml" />
		<description></description>
		
		<% control Events %>
		<item>
				<description>$Description </description>
        		<% control Event %>
	        		<title>$Title</title>
					<link>{$AbsoluteLink}</link>
					<pubDate>$Created</pubDate>
					<guid>{$AbsoluteLink}</guid>
					<cost>$Cost</cost>
					<image>$Image.AbsoluteURL</image>
					<smallimage>$Image.SmallImage.AbsoluteURL</smallimage>
				<% end_control %>
				<location><% if Event.Location %>$Event.Location - <% end_if %>
				<% if Event.Venues %>
				<% control Event.Venues %>
				$Title
				<% end_control %>
				<% end_if %>
				</location>
				<dates>$StartDate.format(M j)<% if EndDate %> - $EndDate.format(M j)<% end_if %></dates>
				
		</item>
		<% end_control %>
		
	</channel>
</rss>