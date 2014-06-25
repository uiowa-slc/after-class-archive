<footer id="page_footer">
	<div class="row">
		<div class="large-8 columns">
			<div class="disability-statement"><p>Individuals with disabilities are encouraged to attend all University of Iowa-sponsored events. If you are a person with a disability who requires an accommodation in order to participate in this program, please contact <a href="mailto:bret-gothe@uiowa.edu">Bret Gothe</a> in advance at 319-335-3132.</p></div>
			<ul>
				<li><a href="{$BaseHref}events">Calendar</a></li>
				<li><a href="{$BaseHref}events/categories">Categories</a></li>
				<li><a href="{$BaseHref}events/sponsors">Sponsors</a></li>
				<li><a href="{$BaseHref}events/venues">Venues</a></li>
				<li><a href="{$BaseHref}events/">All Events</a></li>
				<li><a href="{$BaseHref}add/">Submit an Event</a></li>
				<% if FutureDeadlines %>
				<li><a href="{$BaseHref}deadlines/">Upcoming Deadlines</a></li>
				<% end_if %>
			</ul>
			<div class="clear"></div>
			<div id="footer-social-media">
				<% include MailChimpForm %>
				
			</div>
			
		</div>
		<div class="large-4 columns">
			<div id="dsl-info">
			<div id="logo-container">
				<a href="http://www.uiowa.edu" class="uiowa-logo"> <img src="{$ThemeDir}/images/ui_logo.png" alt="The University of Iowa Logo" /></a> 
				<a href="http://studentlife.uiowa.edu/"><img src="{$ThemeDir}/images/dsl_logo.png" alt="The University of Iowa Logo" /></a>  
			</div>
			<p>319-335-3132<br />
			<a href="mailto:afterclass@uiowa.edu">afterclass@uiowa.edu</a><br />
			<a href="http://studentlife.uiowa.edu/md/" target="_blank">Site designed by Student Life Marketing + Design</a>
			<!--<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
			<a href="https://twitter.com/share" class="twitter-share-button" data-hashtags="AfterClass">Tweet</a>-->
			</p>
		</div>
	</div>
</footer>