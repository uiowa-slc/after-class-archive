    	   	<% if AllCategories %>
    	   	<div class="event_categories">
    	   	<span>Tagged as:</span>
            	<ul>
            		<% control AllCategories %>
            			<li><a href="$Link">$Title</a><% if Last %><% else %>, <% end_if %></li>
            		<% end_control %>
            	</ul>
            </div>
            <% end_if %>