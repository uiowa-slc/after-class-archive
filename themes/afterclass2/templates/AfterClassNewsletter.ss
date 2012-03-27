<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>After Class E-Newsletter</title>
</head>
<style type="text/css">
* {
  font-family: arial,helvetica,sans-serif;
}
html,body,td {
  font-family: arial,helvetica,sans-serif;
}
</style>
<body bgcolor="#47354c" style="color: #FFFFFF; background-image:url(http://news.imu.uiowa.edu/assets/AfterClassNewsletter/background.jpg); font-family: 'Helvetica Neue', arial, helvetica, sans-serif; color: white">
<div id="thebody" style="font-family: 'Helvetica Neue', arial, helvetica, sans-serif;">
<center>

<!-- pseudo body table -->
<table border="0" cellpadding="0" cellspacing="0" bgcolor="transparent" width="99%">
	<tbody>
		<tr>
			<td align="center">
<div style="font-size: 11px;"><a href="{$BaseHref}{$Link}" style="color:#CCC;margin: 2px 0px 5px 0px; text-decoration: none;">View this message in your browser.</a></div>
<!-- wrapper table for email -->
<table border="0" cellpadding="0" cellspacing="0" bgcolor="transparent" width="600">
	<tbody>
		<tr>
		<td align="center">

<!-- start of email -->
			<table  cellpadding="0" cellspacing="0" bgcolor="transparent" width="600">
				<tbody>
				<tr>
					<td width="600" valign="top" bgcolor="transparent">


<!-- main content goes here -->
					<table cellpadding="0" cellspacing="0" width="600" bgcolor="#221e23">
						<tbody>
						
						<tr><td width="600" colspan="2" height="215" valign="top">
							<a href="http://afterclass.uiowa.edu"><img src="http://news.imu.uiowa.edu/assets/AfterClassNewsletter/afterclass-header.jpg"/></a>
						</td></tr>
						<tr style="border-style: solid; border-weight: 1px; border-color:#8f9ca1;"><td width="600" valign="top" style="">
						  <table cellpadding="10"><tr><td>
						  $Content
						  </td></tr></table>
						</td></tr>
<% control FeaturedEvent %>
						<tr width="598" bgcolor="#444" style="border-style: solid; border-weight: 1px; border-color:#8f9ca1">
							<td width="470" colspan="2" style="padding: 0px; margin:0px; border: 1px solid #8f9ca1;">
								<center>
								<a href="$AbsoluteLink">
								<% control Image %>
			  					<% control CroppedImage(598,350) %>
									<img src="$AbsoluteURL" alt="Feature" border="0">
			  					<% end_control %>
								<% end_control %>
								</a>
								</center>
								
								<h1 style="padding: 5px 5px 5px 15px; margin:0px; color:white; font-weight: bold; font-size:34px; border-bottom: 1px solid #5A5A5A; background: #333;">$Title</h1>
								<table cellpadding="10"><tr><td>
								<table><tr><td width="450">
								<div style="padding:0; margin:0">
									<span style="font-size: 18px;text-transform: uppercase; color:#ffd520; font-weight: normal;">Where?</span>
									$Location <% control Venues %><% if First %>$Title<% else %>, $Title<% end_if %><% end_control %>
								</div>
								<div style="padding:0; margin:0">
									<span style="font-size: 18px; text-transform: uppercase; color:#ffd520; font-weight: normal">When?</span>
									<% control DateAndTime %> 
		    							<span>$StartDate.Format(D), $StartDate.Format(M). $StartDate.DayOfMonth</span>
		    							<% if StartTime %> at $StartTime.nice<% end_if %>
		    							<% if EndDate %> -
		    			 					<span>$EndDate.Format(D), $EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			 				<% end_if %> 
	    							<% end_control %>
	    						</div>
	    						</td><td valign="top">
									<a href="$AbsoluteLink" style="text-decoration:none;padding:0; margin:10px 0px 0px 0px;">
									<h5  style="width:110px; height:25px; background-color:#2791AE; text-align:center; valign:center; font-size: 15px; border: 1px solid #8f9ca1; color:#FFF; padding-top:5px;margin:0; "> view event</h5></a>
									</td></tr></table>
								<div style="font-size:16px;padding:0; margin:0">$Content</div>
								</td></tr></table>
							</td>
						</tr>
												
						</tbody>						
					</table>
<% end_control %>
<!-- main content ends -->

<!-- happening next/about section -->
<table cellpadding="0" cellspacing="0" border="0" style="margin-top: 10px" width="600">
	<tr><td align="center">
	<img src="http://afterclass.uiowa.edu/themes/afterclass2/images/coming_soon.png" width="500">
	<% if Event1 %>
	<% control Event1 %>
		<table bgcolor="#323232" style="border: 1px solid #555; padding: 5px 10px 10px 10px;">
		<tr><td width="460" valign="top" style="padding: 10px 0px 5px 0px;">
		<h3 style="padding:0px 0px 10px 0px; margin:0px;"><a href="$AbsoluteLink" style="color:#FFF5D1; font-size:24px; text-decoration: none;">$Title</a></h3>
			<div style="font-size: 16px;">
				<% control DateAndTime %> 
		    		<span>$StartDate.Format(D), $StartDate.Format(M). $StartDate.DayOfMonth</span>
		    			<% if EndDate %> -
		    				<span>$EndDate.Format(D), $EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			<% end_if %> 
	    		<% end_control %> at <% control Venues %>$Title<% end_control %>
	    		<div style="padding: 6px 15px 0px 0px; font-size: 13px;">
	    			$Content.Summary(20) <a href="$Link" style="text-decoration: none; font-size: 13px;color: #FFF5D1;font-weight: bold;">(more)</a>
	    		</div>
			</div>
			<div style="font-size: 16px;"><% if StartTime %> at $StartTime.nice<% end_if %></div>
		</td><td valign="top" style="padding: 10px 0px 5px 0px;">
		<div style="margin: 0px 20px 0px 0px; border: 1px solid;">
			<a href="$AbsoluteLink"><img border="0" src="$Image.SmallImage.AbsoluteURL"></a>
		</div>
		</td></tr>
		</table>
	<% end_control %>
	<% end_if %>
	<% if Event2 %>
	<% control Event2 %>
		<table bgcolor="#292929" style="border: 1px solid #555; padding: 5px 10px 10px 10px;">
		<tr><td width="460" valign="top" style="padding: 10px 0px 5px 0px;">
		<h3 style="padding:0px 0px 10px 0px; margin:0px;"><a href="$AbsoluteLink" style="color:#FFF5D1; font-size:24px; text-decoration: none;">$Title</a></h3>
			<div style="font-size: 16px;">
				<% control DateAndTime %>
		    		<span>$StartDate.Format(D), $StartDate.Format(M). $StartDate.DayOfMonth</span>
		    			<% if EndDate %> -
		    				<span>$EndDate.Format(D), $EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			<% end_if %>
	    		<% end_control %> at <% control Venues %>$Title<% end_control %>
	    		<div style="padding: 6px 15px 0px 0px; font-size: 13px;">
	    			$Content.Summary(20) <a href="$Link" style="text-decoration: none; font-size: 13px;color: #FFF5D1;font-weight: bold;">(more)</a>
	    		</div>
			</div>
			<div style="font-size: 16px;"><% if StartTime %> at $StartTime.nice<% end_if %></div>
		</td><td valign="top" style="padding: 10px 0px 5px 0px;">
		<div style="margin: 0px 20px 0px 0px; border: 1px solid;">
			<a href="$AbsoluteLink"><img border="0" src="$Image.SmallImage.AbsoluteURL"></a>
		</div>
		</td></tr>
		</table>
	<% end_control %>
	<% end_if %>
	<% if Event3 %>
	<% control Event3 %>
		<table bgcolor="#323232" style="border: 1px solid #555; padding: 5px 10px 10px 10px;">
		<tr><td width="460" valign="top" style="padding: 10px 0px 5px 0px;">
		<h3 style="padding:0px 0px 10px 0px; margin:0px;"><a href="$AbsoluteLink" style="color:#FFF5D1; font-size:24px; text-decoration: none;">$Title</a></h3>
			<div style="font-size: 16px;">
				<% control DateAndTime %> 
		    		<span>$StartDate.Format(D), $StartDate.Format(M). $StartDate.DayOfMonth</span>
		    			<% if EndDate %> -
		    				<span>$EndDate.Format(D), $EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			<% end_if %> 
	    		<% end_control %> at <% control Venues %>$Title<% end_control %>
	    		<div style="padding: 6px 15px 0px 0px; font-size: 13px;">
	    			$Content.Summary(20) <a href="$Link" style="text-decoration: none; font-size: 13px;color: #FFF5D1;font-weight: bold;">(more)</a>
	    		</div>
			</div>
			<div style="font-size: 16px;"><% if StartTime %> at $StartTime.nice<% end_if %></div>
		</td><td valign="top" style="padding: 10px 0px 5px 0px;">
		<div style="margin: 0px 20px 0px 0px; border: 1px solid;">
			<a href="$AbsoluteLink"><img border="0" src="$Image.SmallImage.AbsoluteURL"></a>
		</div>
		</td></tr>
		</table>
	<% end_control %>
	<% end_if %>
	<% if Event4 %>
	<% control Event4 %>
		<table bgcolor="#292929" style="border: 1px solid #555; padding: 5px 10px 10px 10px;">
		<tr><td width="460" valign="top" style="padding: 10px 0px 5px 0px;">
		<h3 style="padding:0px 0px 10px 0px; margin:0px;"><a href="$AbsoluteLink" style="color:#FFF5D1; font-size:24px; text-decoration: none;">$Title</a></h3>
			<div style="font-size: 16px;">
				<% control DateAndTime %>
		    		<span>$StartDate.Format(D), $StartDate.Format(M). $StartDate.DayOfMonth</span>
		    			<% if EndDate %> -
		    				<span>$EndDate.Format(D), $EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			<% end_if %>
	    		<% end_control %> at <% control Venues %>$Title<% end_control %>
	    		<div style="padding: 6px 15px 0px 0px; font-size: 13px;">
	    			$Content.Summary(20) <a href="$Link" style="text-decoration: none; font-size: 13px;color: #FFF5D1;font-weight: bold;">(more)</a>
	    		</div>
			</div>
			<div style="font-size: 16px;"><% if StartTime %> at $StartTime.nice<% end_if %></div>
		</td><td valign="top" style="padding: 10px 0px 5px 0px;">
		<div style="margin: 0px 20px 0px 0px; border: 1px solid;">
			<a href="$AbsoluteLink"><img border="0" src="$Image.SmallImage.AbsoluteURL"></a>
		</div>
		</td></tr>
		</table>
	<% end_control %>
	<% end_if %>
	<% if Event5 %>
	<% control Event5 %>
		<table bgcolor="#323232" style="border: 1px solid #555; padding: 5px 10px 10px 10px;">
		<tr><td width="460" valign="top" style="padding: 10px 0px 5px 0px;">
		<h3 style="padding:0px 0px 10px 0px; margin:0px;"><a href="$AbsoluteLink" style="color:#FFF5D1; font-size:24px; text-decoration: none;">$Title</a></h3>
			<div style="font-size: 16px;">
				<% control DateAndTime %> 
		    		<span>$StartDate.Format(D), $StartDate.Format(M). $StartDate.DayOfMonth</span>
		    			<% if EndDate %> -
		    				<span>$EndDate.Format(D), $EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			<% end_if %> 
	    		<% end_control %> at <% control Venues %>$Title<% end_control %>
	    		<div style="padding: 6px 15px 0px 0px; font-size: 13px;">
	    			$Content.Summary(20) <a href="$Link" style="text-decoration: none; font-size: 13px;color: #FFF5D1;font-weight: bold;">(more)</a>
	    		</div>
			</div>
			<div style="font-size: 16px;"><% if StartTime %> at $StartTime.nice<% end_if %></div>
		</td><td valign="top" style="padding: 10px 0px 5px 0px;">
		<div style="margin: 0px 20px 0px 0px; border: 1px solid;">
			<a href="$AbsoluteLink"><img border="0" src="$Image.SmallImage.AbsoluteURL"></a>
		</div>
		</td></tr>
		</table>
	<% end_control %>
	<% end_if %>
	
	</td></tr>
</table>
<!-- Blog Post Info -->
<table style="margin: 10px 0px 10px 0px; background: #333; border: 1px solid #555;" width="600">
	<tr>
		<td width="305" valign="top">
			<div style="padding: 0px 10px 0px 10px;">
			
			
			
			<a href="http://imu.uiowa.edu/blog/" style="text-decoration: none;">
				<h2 style="color:#ffd520; font-size: 30px; margin:0; padding:0; text-decoration: none; border: 0px;">from the blog</h2>
			</a>
			<a href="$BlogLink" style="text-decoration: none; color: #FFF;">
				<h3 style="margin: 0px 0px 5px 0px;">$BlogTitle</h3>
			</a>
			<div style="font-size: 14px; line-height: 20px;">$BlogIntro</div>
			<div style=""><a href="$BlogLink" style="display:block;margin: 10px 0px 10px 0px; color:#FFF; font-weight:bold;">Read more on our blog...</a></div>
			</div>
		</td>
		<td valign="top">
			<div style="padding: 0px 0px 0px 5px;">
			<h2 style="color:#ffd520; font-size: 30px; margin:0; padding:0">$ImageHeading</h2>
			<% if Image %>
			  <div style="padding: 5px 0px;"><a href="$PicLinkURL">
				<% control Image %>
			  	<% control CroppedImage(250,187) %>
					<img src="$AbsoluteURL" alt="Recent Pics" border="0">
			 	<% end_control %>
				<% end_control %>
			  </a></div>
			<% end_if %>
		</td>
		</tr>
</table>
<!-- About After Class -->
<table style="margin: 10px 0px 10px 0px; background: #333; border: 1px solid #555;" width="600">
	<tr>
		<td width="305" valign="top">
			<div style="padding: 0px 10px 10px 10px;">
			<h2 style="color:#ffd520; font-size: 30px; margin:0; padding:0">about after class</h2>
			<p style="font-weight: normal;font-size: 15px; padding:0, margin:0">After Class, a project of the Division of Student Life at the University of Iowa,  brings you the best of campus culture, events, and nightlife - stuff to do "after class."</p>
			<a href="http://afterlcass.uiowa.edu/" style="text-decoration:none; color: white"><h4 style="text-align: center; padding-top:5px;margin:0; background-color:#2791ae; width: 180px; height: 25px; border: 1px solid #8f9ca1">check out the site</h4></a>
			</div>
		</td>
		<td valign="top">
			<h2 style="color:#ffd520; font-size: 30px; margin:0; padding:0">promote your stuff</h2>
			<p style="font-weight: normal;font-size: 15px; padding:0, margin:0"> Use After Class to promote your event to a student audience! You can add your own events on the website</p>
			<a href="http://afterclass.uiowa.edu/add" style="text-decoration:none; color: white"><h4 style="text-align: center; padding-top:5px; margin-bottom:20px; margin-top:0; background-color:#2791ae; width: 180px; height: 25px; border: 1px solid #8f9ca1">add your event</h4></a>
		</td>
		</tr>
</table>

<!-- Bookstore Advertisement -->

<% if BookstoreImage %>
<table style="margin: 10px 0px 10px 0px; background: #333; border: 1px solid #555;" width="600">
	<tr><td>
		<a href="$BookstoreImageLink">
			<% control BookstoreImage %>
			  <% control CroppedImage(590,200) %>
				<img src="$AbsoluteURL" alt="Ad" border="0">
			  <% end_control %>
			<% end_control %>
		</a>
	</td></tr>
</table>
<% end_if %>

<!-- DSL -->
<table style="margin: 10px 0px 10px 0px; background: #333; border: 1px solid #555;" width="600">
	<tr>
		<td width="305" valign="top">
			<div style="padding: 10px 10px 10px 10px;">
			<img src="http://hulk.imu.uiowa.edu/afterclass_dev/themes/afterclass2/images/dstack.png" style="margin: 0px 0px 10px 0px; width:250px;">
			<!--ui_logo.png<img src="http://hulk.imu.uiowa.edu/afterclass_dev/themes/afterclass2/images/dsl_logo.png" width="250">-->
			</div>
		</td>
		<td valign="top">
			<div style="font-weight: normal;font-size: 15px; padding:0; margin:10px 10px 0px 0px; color:#FFF; text-align: right;">
				<div style="color: #FFD520; font-size: 30px; font-weight: bold; width:250px; text-align: right;">after class</div>
				319-335-3117<br />
				<a href="mailto:afterclass@uiowa.edu" style="color:#FFF;">afterclass@uiowa.edu</a>
			</div>
		</td>
		</tr><tr><td colspan="2">
		<div style="font-size: 14px; padding: 10px 10px 10px 10px;">
		Individuals with disabilities are encouraged to attend all University of Iowa events. If you are an individual with a disability who needs an accomodation, please contact the Division of Student life at 319-335-3117.<br />
		<br />
		<a href="*|UNSUB|*" style="color:#FFF;">Click here to unsubscribe</a>
		</div>
		</td></tr>
</table>

<!-- happening next/aboutsection ends-->
<!-- content ends -->


					</td>
				</tr>
				</tbody>
			</table>

			</td>
		</tr>
	</tbody>
</table>
<!-- close wrapper table for email -->


			</td>
		</tr>
	</tbody>
</table>
<!-- close pseudo body table -->

</center>
</div>
</body>
</html>