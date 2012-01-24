<?xml version="1.0"?>
<rss version="2.0" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:atom="http://www.w3.org/2005/Atom">
	<channel>
		<title>Upcoming Events for Happening Now</title>
		<link>http://hulk.imu.uiowa.edu/afterclass_dev/events/</link>
		<atom:link href="http://hulk.imu.uiowa.edu/afterclass_dev/events/" rel="self" type="application/rss+xml" />
		<description></description>
		
        	<% control Events %>
        		<item>
        		<% control Event %>
        		<title>$Title</title>
				<link>
				{$BaseHref}{$URLSegment}
				</link>
				<guid>
				{$BaseHref}{$URLSegment}
				</guid>
				<description>
				$Description
				</description>
				<cost>
				$Cost
				</cost>
				<location>
				$Location
				</location>
				<% end_control %>
				
				<dates>
				$StartDate.format(M j)<% if EndDate %> - $EndDate.format(M j)<% end_if %>
				</dates>
				<venues>
				<% if Venues %><% control Venues %>$Title<br/><% end_control %><% end_if %>
				</venues>
				
            	</item>
            <% end_control %>
            
	</channel>
</rss>