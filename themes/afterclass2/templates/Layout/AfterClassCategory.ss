<header id="secondary_header">
 	<h1>$Category.Title</h1>
</header>


 <div id="single-page-content">

 			
 			<div class="about-category">
 			<p>$Category.Information</p>
 			<% if LinkURL %><p><a href="$LinkURL">Visit Website</a></p><% end_if %>
 			
 			</div>
 		
		

 	
		
		
		<% control Category %>
		
		<% if ClassName = Sponsor %>
 			<h2>Current events Sponsored by $Title:</h2>
 		<% else_if ClassName = Venue %>
 			<h2>Current events at $Title:</h2>
 		<% else_if ClassName = Eventtype %>
 		
 		<% end_if %>	
		
			<% if Events %>
				<% control Events %>
					<% control Event %>	
						<% if Featured %>
							<% include FeaturedEvent %>    			    	
				 		<% end_if %><!-- End If Featured -->
		    		<% end_control %><! -- end control event -->
		    	<% end_control %> <!-- end control events -->
		    <% else %><!-- if there aren't any events -->
				
				    <h2>There are no events currently listed here.</h2>
				    <p>Please check the <a href="$BaseHref">the homepage</a> or the following categories for what's happening currently. </p>
				    <p>Want to promote your student organization's upcoming event? <a href="{$BaseHref}add-event/">Submit it to us and we'll post it!</a></p>
				   <!-- <ul>
				    	<li>Test</li>
				    	<li>Test</li>
				    </ul> -->

		    <% end_if %> <!-- end if events -->
		    
		<% end_control %><!-- end control category -->
		
		
		
			<% control Category %>
				<% if Events %>
					<% include SecondaryEvents %>
				<% end_if %><!-- end if events -->
			<% end_control %>
						 </div>
		
		
