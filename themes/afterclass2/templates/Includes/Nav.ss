<nav id="page_navigation">

	<div class="container">
	<ul class="clearfix">
		<li class="first" ><a href="{$BaseHref}">Home</a></li>
		<li class="first moon-icon" ><a href="{$BaseHref}"><img src="{$ThemeDir}/images/moon_icon.png"></a></li>
		<li id="news"><a href="news/">news</a></li>
		<li><a href="nearby/" class="near-me-link">Nearby</a></li>
		<li class="today"><a href="$TodayLink">Today</a></li>
		<li class="weekend"><a href="$WeekendLink">Weekend</a></li>
		<li><a href="{$Link}#" id="calendar-expand">Full Calendar</a></li>
		
		<li><a href="http://eepurl.com/vWmfP" class="subscribe-link" target="_blank">Subscribe</a></li>
		<% loop Menu(1) %>
			<% if First %>
			<% else %>
			<li class="$URLSegment">
				<a href="$Link"><strong>$MenuTitle</strong></a>
				<% if Children %>
					<ul>
						<% loop Children %>
							<li><a href="$Link" <% if RedirectionType = External %>class="external" target="_blank"<% end_if %> >$Title</a></li>
						<% end_loop %>
					</ul>
				<% end_if %>
			</li>
			<% end_if %>
		<% end_loop %>

		</ul>
		<div class="clear"></div>
		
		<% include SecondaryNav %>
		
		
   <div style="clear: both"></div>
 </div><!-- end container -->
</nav>