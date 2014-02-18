<div class="secondary-nav">
		
			<div id="calendar-filter-form">
				$CalendarWidget
			</div>
			<div class="filters">
				<form id="SearchForm_SearchForm" action="{$BaseHref}events/SearchForm" method="get" enctype="application/x-www-form-urlencoded">
					<fieldset>
						<legend></legend>
							<div id="Search" class="field text  nolabel"><div class="middleColumn"><input type="text" class="text nolabel" id="SearchForm_SearchForm_Search" name="Search" placeholder="Search for an event"></div></div>
							<input class="action " id="SearchForm_SearchForm_action_results" type="submit" name="action_results" value="Go" title="Go">
					</fieldset>
				</form>

				<h3>Trending Categories</h3>
					<% with Calendar %>
						<p><% loop TrendingEventtypes %>
								<a href="$Link">$Title</a> | 
						<% end_loop %></p>
					<% end_with %>
				<h3>View Events By</h3>
				<ul>
					<li><a href="{$BaseHref}events/categories/">Categories</a></li>
					<li><a href="{$BaseHref}events/sponsors/">Sponsors</a></li>
					<li><a href="{$BaseHref}events/venues/">Venues</a></li>
				</ul>
			</div>
		</div>