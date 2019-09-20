<nav id="page_navigation">
	<div class="row">
		<div class="medium-12 large-12 columns">
			<ul class="clearfix">
				<li class="first" ><a href="{$BaseHref}">Calendar</a></li>
				<li class= "nearby"><a href="nearby/" class="near-me-link">Nearby</a></li>
				<li class="today"><a href="events/show/today">Today</a></li>
				<li class="weekend"><a href="events/show/weekend">Weekend</a></li>
				<li class="hide-for-large-up"><a href="{$Link}#" id="calendar-expand">Discover</a></li> 
				<li class= "suscribe"><a href="http://eepurl.com/vWmfP" class="subscribe-link" target="_blank">Subscribe</a></li>
				<% loop Menu(1) %>
					<% if First %>
					<% else %>
					<li class="$URLSegment">
						<a href="$Link">$MenuTitle</a>
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
				<div class="hide-for-large-up">
					<% include MobileSecondaryNav %>
				</div>
				
		   <div style="clear: both"></div>
		</div><!-- end large-12 -->
 </div><!-- end container -->
</nav>