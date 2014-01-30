<!doctype html>

<head>
	<% base_tag %>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,700italic,400,600,700' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Doppio+One' rel='stylesheet' type='text/css'>
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title>After Class Categories</title>


	<% require themedCSS(layout) %>
	</head>
	<body>
<div id="categories">
		<h2><img src="{$ThemeDir}/images/by_type.png" alt="By Type" /></h2>
		<div id="categories-container">
		<ul class="category">
		
			<% loop getEventtypes %>
				<% if Events %>
					<li><h3><a href="events/categories/$Title" target="_blank">$Title ($Events.Count)</a></h3>
					
						<ul>
							<% loop Events %>
								<li><a href="$Event.Link" target="_blank">$Event.Title</a></li>
							<% end_loop %>
						
						</ul>
					
					
					</li>				
				<% end_if %>
			
			
			
			<% end_loop %>
		
		
		</ul><!-- end category -->
	</div><!-- end categories-container -->
	</body>
	</html>
