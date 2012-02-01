<?xml version="1.0"?>
<rss version="2.0" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:atom="http://www.w3.org/2005/Atom">
	<channel>
		<title>Upcoming Events for Happening Now</title>
		<link>http://afterclass.uiowa.edu/events/</link>
		<atom:link href="http://hulk.imu.uiowa.edu/afterclass_dev/events/" rel="self" type="application/rss+xml" />
		<description></description>
		
		<% control Events %>
		<item>
				<description>$Description </description>
        		<% control Event %><title>$Title</title>
				<link>{$BaseHref}{$URLSegment}</link>
				<pubDate>Thu, 19 Jan 2012 14:21:15 -0600</pubDate>
				<guid>{$BaseHref}{$URLSegment}</guid>
				<cost>$Cost</cost>
				<smallimage>$Image.SmallImage.AbsoluteURL</smallimage>
				<location>$Location</location><% end_control %>
				<dates>$StartDate.format(M j)<% if EndDate %> - $EndDate.format(M j)<% end_if %></dates>
				<% if Venues %><venues><% control Venues %>$Title<br/><% end_control %></venues><% end_if %>
		</item>
		<% end_control %>
		
	</channel>
</rss>