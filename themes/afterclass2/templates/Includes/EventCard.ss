	<li class="event-card" 
	
	<% control Image %>
	
		<% control SetWidth(300) %>
		style="background-image: url('{$ThemeDir}/images/card_bg.png'), url('$URL')"
		<% end_control %>
		
	<% end_control %>
	>
		<div class="event-card-background">
			<!--<% if Image %>"><a href="$Link"><img src="$Image.SmallImage.URL"></a><% end_if %>-->
			<div class="info">
			<a href="$Link"><strong>$Title</strong></a><br />
			
				 <div id="dates">
	    			<% control DateAndTime %> 
		    			<a href="{$BaseHref}events/view/$StartDate.Format(Ymd)" class="date-link">
		    				<span>$StartDate.Format(M). $StartDate.DayOfMonth</span></a> 
		    			<% if EndDate %> -
		    				<a href="{$BaseHref}events/view/$EndDate.Format(Ymd)" class="date-link">
		    			 		<span>$EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			 	</a>
		    			 	<% end_if %> 
		    			 <br />
	    			<% end_control %>
	    			</div>
    			
    			<div class="where">
					<% if Venues %>
						<ul>
						<% control Venues %>
							<li>@ <a href="$Link">$Title</a></li>
						<% end_control %>
						</ul>
					<% end_if %>
				</div>
				
				</div>
			
			</li>