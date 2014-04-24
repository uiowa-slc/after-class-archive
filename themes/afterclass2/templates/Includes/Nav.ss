<nav id="page_navigation">

	<div class="container">
	<ul class="clearfix">
		<li class="first" ><a href="{$BaseHref}">Calendar</a></li>
		<li class="first moon-icon" ><a href="{$BaseHref}"><img src="{$ThemeDir}/images/moon_icon.png"></a></li>
		<li id="news"><a href="news/">news</a></li>
		<li class= "nearby"><a href="nearby/" class="near-me-link">Nearby</a></li>
		<% with Calendar %><li class="today"><a href="$Link(today)">Today</a></li><% end_with %>
		<% with Calendar %><li class="weekend"><a href="$Link(weekend)">Weekend</a></li><% end_with %>
		<li class="visible-phone visible-tablet"><a href="{$Link}#" id="calendar-expand">Filter Events</a></li>
		
		<li class= "suscribe"><a href="http://eepurl.com/vWmfP" class="subscribe-link" target="_blank">Subscribe</a></li>
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
		<div class="hidden-desktop">
			<% include SecondaryNav %>
		</div>
		
   <div style="clear: both"></div>
 </div><!-- end container -->
</nav>