    	   	<% if AllCategories %>
    	   	<div class="event_categories">
    	   	<span>Tagged as:</span>
            	<ul>
            		<% loop AllCategories %>
            			<li class="$FirstLast"><a href="$Link">$Title</a><% if Last %><% else %>, <% end_if %></li>
            		<% end_loop %>
            	</ul>
            </div>
            <% end_if %>