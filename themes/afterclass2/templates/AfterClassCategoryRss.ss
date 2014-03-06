<?xml version="1.0"?>
<rss version="2.0" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:atom="http://www.w3.org/2005/Atom">
	<channel>
		<title>After Class: the best source for University of Iowa events &amp; Iowa City events, culture, nightlife, and more!</title>
		<link>http://afterclass.uiowa.edu/events/{$Action}</link>
		<atom:link href="http://afterclass.uiowa.edu/events/" rel="self" type="application/rss+xml" />
		<description></description>
		<% loop Events %>
		<item>
				<title>$Title</title>
				<description>$Content.Summary(50)</description>
				<link>{$BaseHref}{$URLSegment}</link>
				<pubDate>$Created</pubDate>
				<guid>{$BaseHref}{$URLSegment}</guid>
				<cost>$Cost</cost>
				<smallimage>$Image.SmallImage.AbsoluteURL</smallimage>
				<location>$Location</location>
				<dates><% loop UpcomingDatesAndRanges.Limit(1) %>$StartDate.format(M j)<% if EndDate %> - $EndDate.format(M j)<% end_if %><% end_loop %></dates>
				<% if Venues %><venues><% loop Venues %>$Title<br/><% end_loop %></venues><% end_if %>
		</item>
		<% end_loop %>
	</channel>
</rss>