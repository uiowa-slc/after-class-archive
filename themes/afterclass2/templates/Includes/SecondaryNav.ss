<div class="secondary-nav row-fluid">

				<div id="calendar-filter-form">

					<form id="SearchForm_SearchForm" action="{$BaseHref}events/SearchForm" method="get" enctype="application/x-www-form-urlencoded">
						<fieldset>
							<legend></legend>
								<div id="Search" class="field text  nolabel"><div class="middleColumn"><input type="text" class="text nolabel" id="SearchForm_SearchForm_Search" name="Search" placeholder="Search for an event"></div></div>
								<input class="action" id="SearchForm_SearchForm_action_results" type="search" results="5" name="action_results" value="Go" title="Go">
						</fieldset>
					</form>
				<% with Calendar %>
					$CalendarWidget
				<% end_with %>
					<h3>Trending Categories</h3>
						<p>
								<a href="http://afterclass.uiowa.edu/events/categories/Campus Events">Campus Events</a>,  
								<a href="http://afterclass.uiowa.edu/events/categories/Movies">Movies</a>,  
								<a href="http://afterclass.uiowa.edu/events/categories/Lecture">Lecture</a>,  
								<a href="http://afterclass.uiowa.edu/events/categories/Sales">Sales</a>,  
								<a href="http://afterclass.uiowa.edu/events/categories/Wellness">Wellness</a>,  
								<a href="http://afterclass.uiowa.edu/events/categories/Music">Music</a>,  
								<a href="http://afterclass.uiowa.edu/events/categories/Recreation">Recreation</a>,  
								<a href="http://afterclass.uiowa.edu/events/categories/Dance">Dance</a>,  
								<a href="http://afterclass.uiowa.edu/events/categories/Food">Food</a>,  
								<a href="http://afterclass.uiowa.edu/events/categories/Comedy">Comedy</a>,  
								<a href="http://afterclass.uiowa.edu/events/categories/Performance">Performance</a>,  
								<a href="http://afterclass.uiowa.edu/events/categories/Multicultural Events">Multicultural Events</a>,  
								<a href="http://afterclass.uiowa.edu/events/categories/Competition">Competition</a>,  
								<a href="http://afterclass.uiowa.edu/events/categories/Intramural Sports">Intramural Sports</a>,  
						</p>					
							<%--<p><% loop TrendingEventtypes %>
									<a href="$Link">$Title</a><% if not $Last %>, <% end_if %>
							<% end_loop %></p>--%>
					
					<h3>View Upcoming Events List By</h3>

						<a href="{$BaseHref}events/categories/" class="button">Event Type</a>
						<a href="{$BaseHref}events/sponsors/" class="button">Sponsor</a>
						<a href="{$BaseHref}events/venues/" class="button">Venue</a>

				</div>
			</div>
	