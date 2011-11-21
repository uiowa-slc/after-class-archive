<!doctype html>
<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js ie7 oldie" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8 oldie" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
	<base href="http://hulk.imu.uiowa.edu/afterclass_dev/" />
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title>After Class - The Best of UI's Culture, Concerts and Nightlife</title>
	<meta name="description" content="Iowa City Movies, Concerts, Lectures, and Campus Events">
	<meta name="author" content="IMU Marketing &amp; Design">

	<meta name="viewport" content="width=device-width,initial-scale=1">

	<% require themedCSS(layout) %> 

	<script src="js/libs/modernizr-2.0.6.min.js"></script>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,700italic,400,600,700' rel='stylesheet' type='text/css'>
</head>
<body>



<div id="student_life_header">
	Hi
</div>
<header id="page_header">
	<div class="container">
		<h1 class="big_header">After Class</h1>
	    <p class="subheader">The best of <em>UI</em>'s culture, concerts, and nightlife</p>
	</div>
</header>
<nav id="page_navigation">
	<div class="container">
	<ul class="clearfix">
		<% control Menu(1) %>
			<li>
				<a href="Link"><strong>$Title</strong> $MenuTitle</a>
				<% if Children %>
				<ul>
					<% control Children %>
						<li><a href="$Link">$Title</a></li>
					<% end_control %>
				</ul>
				<% end_if %>
			</li>
		<% end_control %>
        <!--<li><a href="#"><strong>Category</strong> The type of event</a>
        	<ul>
            	<li><a href="/secondary.php">Movies</a></li>
                <li><a href="#">Lectures</a></li>
                <li><a href="#">Concerts</a></li>
                <li><a href="#">Campus Events</a></li>
            </ul>
        </li>
        <li><a href="#"><strong>Sponsor</strong> Who puts it on</a>
        	<ul>
            	<li><a href="#">Bijou</a></li>
                <li><a href="#">CAB</a></li>
                <li><a href="#">SCOPE</a></li>
            </ul>        	
        </li>
        <li><a href="#"><strong>Venue</strong> Where it takes place</a>
            <ul>
            	<li><a href="#">Englert</a></li>
                <li><a href="#">Hubbard Park</a></li>
                <li><a href="#">IMU</a></li>
            </ul>    
        </li>
        <li><a href="#"><strong>All Events</strong> Stay in the loop</a></li>
        <li><a href="#"><strong>Contact</strong>Market your event</a></li>-->
    </ul>
    </div>
</nav>
<!--cut out header and nav-->
<div id="page_content">
	<div class="container clearfix">
	$Layout
	
    $Form
	
   </div>
</div>
<footer id="page_footer">
	<div class="container">
		<div id="ui_logo">
			<a href="http://www.uiowa.edu"> <img src="{$ThemeDir}/images/ui_logo.png" alt="The University of Iowa Logo" /></a>
		</div>
		<ul>
			<li><a href="#">Category</a></li>
			<li><a href="#">Sponsor</a></li>
			<li><a href="#">Venue</a></li>
			<li><a href="#">All Events</a></li>
			<li><a href="#">Contact</a></li>
		</ul>
		<div id="search_footer">
		<!--Search field goes here-->
		</div>
	</div>
</footer>






<script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/libs/jquery-1.6.2.min.js"><\/script>')</script>

<!-- scripts concatenated and minified via ant build script-->
<script src="js/plugins.js"></script>
<script src="js/script.js"></script>
<!-- end scripts-->

<script>
	var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']]; // Change UA-XXXXX-X to be your site's ID
	(function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];g.async=1;
	g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
	s.parentNode.insertBefore(g,s)}(document,'script'));
</script>

<!--[if lt IE 7 ]>
	<script src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.2/CFInstall.min.js"></script>
	<script>window.attachEvent("onload",function(){CFInstall.check({mode:"overlay"})})</script>
<![endif]-->

</body>
</html>
