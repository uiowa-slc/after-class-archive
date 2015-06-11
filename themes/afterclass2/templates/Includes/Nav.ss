<nav id="page_navigation">
	<div class="row">
		<div class="large-12 columns">
			<ul class="clearfix">
				<li class="first show-for-large-up" ><a href="{$BaseHref}">Calendar</a></li>
				<li class= "nearby"><a href="nearby/" class="near-me-link">Nearby</a></li>
				<% with Calendar %><li class="today"><a href="$Link("show/today")">Today</a></li><% end_with %>
				<% with Calendar %><li class="weekend"><a href="$Link("show/weekend")">Weekend</a></li><% end_with %>
				<li class= "suscribe show-for-large-up"><a href="http://eepurl.com/vWmfP" class="subscribe-link" target="_blank">Subscribe</a></li>
				<% loop Menu(1) %>
					<% if First %>
					<% else %>
					<li class="$URLSegment">
						<% if $URLSegment == "about-after-class" %>
							<a data-dropdown="drop1" aria-controls="drop1" aria-expanded="false" href="$Link">$MenuTitle</a>
								<% if Children %>
									<ul id="drop1" data-dropdown-content class="f-dropdown content" aria-hidden="true" tabindex="-1">
										<% loop Children %>
											<li><a href="$Link" <% if RedirectionType = External %>class="external" target="_blank"<% end_if %> >$Title</a></li>
										<% end_loop %>
									</ul>
								<% end_if %>
								<% else %>
									<a href="$Link">$MenuTitle</a>
						<% end_if %>
					</li>
					<% end_if %>
				<% end_loop %>
				</ul>
				<div class="clear"></div>
				<% if $ClassName == "LocalistCalendar" %>
					<% include MobileSecondaryNav %>
				<% end_if %>
		   <div style="clear: both"></div>
		</div><!-- end large-12 -->
 </div><!-- end container -->
</nav>