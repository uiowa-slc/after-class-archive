<header id="secondary_header">
		<!-- Category, Events, Event -->
			<h1><span>Listed under:</span> $Category.Title</h1>
</header>

		<% with/loopCategory %>
			<% if Events %>
				<% with/loopEvents %>
					<% with/loopEvent %>	
						<% if Featured %>
							<% include FeaturedEvent %>    			    	
				 		<% end_if %><!-- End If Featured -->
		    		<% end_with/loop%><! -- end control event -->
		    	<% end_with/loop%> <!-- end control events -->
		    <% else %><!-- if there aren't any events -->
				 <div id="single-page-content">
				    <h2>There are no events currently listed here.</h2>
				    <p>Please check the <a href="$BaseHref">the homepage</a> or the following categories for what's happening currently. </p>
				    <p>Want to promote your student organization's upcoming event? <a href="{$BaseHref}add-event/">Submit it to us and we'll post it!</a></p>
				   <!-- <ul>
				    	<li>Test</li>
				    	<li>Test</li>
				    </ul> -->
				 </div>

		    <% end_if %> <!-- end if events -->
		    
		<% end_with/loop%><!-- end control category -->
		
		
		
		
			<% with/loopCategory %>
				<% if Events %>
					<% include SecondaryEvents %>
				<% end_if %><!-- end if events -->
			<% end_with/loop%>
				
		
