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
<body bgcolor="#47354c" style="font-family: 'Helvetica Neue', arial, helvetica, sans-serif; color: white;">
<div id="thebody" style="font-family: 'Helvetica Neue', arial, helvetica, sans-serif; color: #FFFFFF; background: #47354c url(http://news.imu.uiowa.edu/assets/AfterClassNewsletter/background.jpg);">
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
					<table cellpadding="0" cellspacing="0" width="600" bgcolor="#221e23" style="text-align: left;">
						<tbody>
						
						<tr><td width="600" colspan="2" height="215" valign="top">
							<a href="http://afterclass.uiowa.edu"><img src="http://news.imu.uiowa.edu/assets/AfterClassNewsletter/afterclass-header.jpg" alt="After Class" border="0"/></a>
						</td></tr>
						<tr style="border-style: solid; border-weight: 1px; border-color:#8f9ca1;"><td width="600" valign="top" style="">
						  <table cellpadding="10"><tr><td>
						  $Content
						  </td></tr></table>
						</td></tr>
<% with/loopFeaturedEvent %>
						<tr width="598" bgcolor="#444" style="border-style: solid; border-weight: 1px; border-color:#8f9ca1">
							<td width="600" colspan="2" style="padding: 0px; margin:0px; border: 1px solid #8f9ca1;">
								<center>
								<a href="$AbsoluteLink">
								<% with/loopImage %>
			  					<% with/loopCroppedImage(598,350) %>
									<img src="$AbsoluteURL" alt="Feature" border="0" alt="Featured Event">
			  					<% end_with/loop%>
								<% end_with/loop%>
								</a>
								</center>
								
								<h1 style="padding: 5px 5px 5px 15px; margin:0px; color:white; font-weight: bold; font-size:34px; border-bottom: 1px solid #5A5A5A; background: #333;">$Title</h1>
								<table cellpadding="10"><tr><td>
								<table><tr><td width="600">
								<div style="padding:0; margin:0; color: #FFF;">
									<span style="font-size: 18px;text-transform: uppercase; color:#ffd520; font-weight: normal;">Where?</span>
									$Location <% with/loopVenues %><% if First %>$Title<% else %>, $Title<% end_if %><% end_with/loop%>
								</div>
								<div style="padding:0; margin:0; color: #FFF;">
									<span style="font-size: 18px; text-transform: uppercase; color:#ffd520; font-weight: normal">When?</span>
									<% with/loopDateAndTime %> 
		    							<span style="color: #FFF;">$StartDate.Format(D), $StartDate.Format(M). $StartDate.DayOfMonth</span>
		    							<% if StartTime %> at $StartTime.nice<% end_if %>
		    							<% if EndDate %> -
		    			 					<span style="color: #FFF;">$EndDate.Format(D), $EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			 				<% end_if %> 
	    							<% end_with/loop%>
	    						</div>
	    						</td><td valign="top">
									<a href="$AbsoluteLink" style="text-decoration:none; padding:0; margin:10px 0px 0px 0px; color: #fff !important;">
									<h5  style="width:110px; height:25px; background-color:#2791AE; text-align:center; valign:center; font-size: 15px; border: 1px solid #8f9ca1; color:#FFF !important; padding-top:5px;margin:0; "> view event</h5></a>
									</td></tr></table>
								<div style="font-size:16px;padding:0; margin:0; color: #fff !important;">$Content</div>
								</td></tr></table>
							</td>
						</tr>
												
						</tbody>						
					</table>
<% end_with/loop%>
<!-- main content ends -->

<!-- happening next/about section -->
<table cellpadding="0" cellspacing="0" border="0" style="margin-top: 10px; padding: 15px 10px 15px 10px;" width="600">
	<tr><td align="center">
	<img src="http://afterclass.uiowa.edu/themes/afterclass2/images/coming_soon.png" width="500">
	<% if Event1 %>
	<% with/loopEvent1 %>
		<table bgcolor="#323232" style="border: 1px solid #555; padding: 15px 10px 15px 10px; text-align: left;">
		<tr width="550"><td width="400" valign="top">
		<h3 style="padding:0px 0px 10px 0px; margin:0px; color: #FFF5D1 !important;"><a href="$AbsoluteLink" style="color: #FFF5D1 !important; font-size:24px; text-decoration: none;">$Title</a></h3>
			<div style="font-size: 16px; color: #fff !important;">
				<% with/loopDateAndTime %> 
		    		<span>$StartDate.Format(D), $StartDate.Format(M). $StartDate.DayOfMonth</span>
		    			<% if EndDate %> -
		    				<span>$EndDate.Format(D), $EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			<% end_if %> 
	    		<% end_with/loop%> at <% with/loopVenues %>$Title<% end_with/loop%>
	    		<div style="padding: 6px 15px 0px 0px; font-size: 13px; color: #fff !important;">
	    			$Content.Summary(20) <a href="$Link" style="text-decoration: none; font-size: 13px;color: #FFF5D1 !important;font-weight: bold;">(more)</a>
	    		</div>
			</div>
			<div style="font-size: 16px;"><% if StartTime %> at $StartTime.nice<% end_if %></div>
		</td><td width="150" valign="top">
		<div style="margin: 0px 20px 0px 0px; border: 1px solid;">
			<a href="$AbsoluteLink"><img border="0" src="$Image.SmallImage.AbsoluteURL" alt="Event Image"></a>
		</div>
		</td></tr>
		</table>
	<% end_with/loop%>
	<% end_if %>
	<% if Event2 %>
	<% with/loopEvent2 %>
		<table bgcolor="#292929" style="border: 1px solid #555; padding: 15px 10px 15px 10px; text-align: left;">
		<tr width="550"><td width="400" valign="top">
		<h3 style="padding:0px 0px 10px 0px; color: #FFF5D1 !important; margin:0px;"><a href="$AbsoluteLink" style="color:#FFF5D1 !important; font-size:24px; text-decoration: none;">$Title</a></h3>
			<div style="font-size: 16px; color: #fff !important;">
				<% with/loopDateAndTime %>
		    		<span>$StartDate.Format(D), $StartDate.Format(M). $StartDate.DayOfMonth</span>
		    			<% if EndDate %> -
		    				<span>$EndDate.Format(D), $EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			<% end_if %>
	    		<% end_with/loop%> at <% with/loopVenues %>$Title<% end_with/loop%>
	    		<div style="padding: 6px 15px 0px 0px; font-size: 13px; color: #FFF !important;">
	    			$Content.Summary(20) <a href="$Link" style="text-decoration: none; font-size: 13px;color: #FFF5D1 !important;font-weight: bold;">(more)</a>
	    		</div>
			</div>
			<div style="font-size: 16px;"><% if StartTime %> at $StartTime.nice<% end_if %></div>
		</td><td width="150" valign="top" style="">
		<div style="margin: 0px 20px 0px 0px; border: 1px solid;">
			<a href="$AbsoluteLink"><img border="0" src="$Image.SmallImage.AbsoluteURL" alt="Event Image"></a>
		</div>
		</td></tr>
		</table>
	<% end_with/loop%>
	<% end_if %>
	<% if Event3 %>
	<% with/loopEvent3 %>
		<table bgcolor="#323232" style="border: 1px solid #555; padding: 15px 10px 15px 10px; text-align: left;">
		<tr width="550"><td width="400" valign="top">
		<h3 style="padding:0px 0px 10px 0px; color: #FFF5D1 !important; margin:0px;"><a href="$AbsoluteLink" style="color:#FFF5D1 !important; font-size:24px; text-decoration: none;">$Title</a></h3>
			<div style="font-size: 16px; color: #fff !important;">
				<% with/loopDateAndTime %> 
		    		<span>$StartDate.Format(D), $StartDate.Format(M). $StartDate.DayOfMonth</span>
		    			<% if EndDate %> -
		    				<span>$EndDate.Format(D), $EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			<% end_if %> 
	    		<% end_with/loop%> at <% with/loopVenues %>$Title<% end_with/loop%>
	    		<div style="padding: 6px 15px 0px 0px; font-size: 13px; color: #FFF !important;">
	    			$Content.Summary(20) <a href="$Link" style="text-decoration: none; font-size: 13px;color: #FFF5D1 !important;font-weight: bold;">(more)</a>
	    		</div>
			</div>
			<div style="font-size: 16px;"><% if StartTime %> at $StartTime.nice<% end_if %></div>
		</td><td width="150" valign="top" style="">
		<div style="margin: 0px 20px 0px 0px; border: 1px solid;">
			<a href="$AbsoluteLink"><img border="0" src="$Image.SmallImage.AbsoluteURL" alt="Event Image"></a>
		</div>
		</td></tr>
		</table>
	<% end_with/loop%>
	<% end_if %>
	<% if Event4 %>
	<% with/loopEvent4 %>
		<table bgcolor="#292929" style="border: 1px solid #555; padding: 15px 10px 15px 10px; text-align: left;">
		<tr width="550"><td width="400" valign="top">
		<h3 style="padding:0px 0px 10px 0px; color: #FFF5D1 !important; margin:0px;"><a href="$AbsoluteLink" style="color:#FFF5D1 !important; font-size:24px; text-decoration: none;">$Title</a></h3>
			<div style="font-size: 16px; color: #fff !important;">
				<% with/loopDateAndTime %>
		    		<span>$StartDate.Format(D), $StartDate.Format(M). $StartDate.DayOfMonth</span>
		    			<% if EndDate %> -
		    				<span>$EndDate.Format(D), $EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			<% end_if %>
	    		<% end_with/loop%> at <% with/loopVenues %>$Title<% end_with/loop%>
	    			<div style="padding: 6px 15px 0px 0px; font-size: 13px; color: #FFF !important;">
	    			$Content.Summary(20) <a href="$Link" style="text-decoration: none; font-size: 13px;color: #FFF5D1 !important;font-weight: bold;">(more)</a>
	    		</div>
			</div>
			<div style="font-size: 16px;"><% if StartTime %> at $StartTime.nice<% end_if %></div>
		</td>
		<td valign="top" width="150">
		<div style="margin: 0px 20px 0px 0px; border: 1px solid;">
			<a href="$AbsoluteLink"><img border="0" src="$Image.SmallImage.AbsoluteURL" alt="Event Image"></a>
		</div>
		</td></tr>
		</table>
	<% end_with/loop%>
	<% end_if %>
	<% if Event5 %>
	<% with/loopEvent5 %>
		<table bgcolor="#323232" style="border: 1px solid #555; padding: 15px 10px 15px 10px; text-align: left;">
		<tr width="550"><td width="400" valign="top">
		<h3 style="padding:0px 0px 10px 0px; color: #FFF5D1 !important; margin:0px;"><a href="$AbsoluteLink" style="color:#FFF5D1 !important; font-size:24px; text-decoration: none;">$Title</a></h3>
		<div style="font-size: 16px; color: #fff !important;">
				<% with/loopDateAndTime %> 
		    		<span>$StartDate.Format(D), $StartDate.Format(M). $StartDate.DayOfMonth</span>
		    			<% if EndDate %> -
		    				<span>$EndDate.Format(D), $EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			<% end_if %> 
	    		<% end_with/loop%> at <% with/loopVenues %>$Title<% end_with/loop%>
	    		<div style="padding: 6px 15px 0px 0px; font-size: 13px; color: #FFF !important;">
	    			$Content.Summary(20) <a href="$Link" style="text-decoration: none; font-size: 13px;color: #FFF5D1 !important;font-weight: bold;">(more)</a>
	    		</div>
			</div>
			<div style="font-size: 16px;"><% if StartTime %> at $StartTime.nice<% end_if %></div>
		</td>
		<td valign="top" width="150">
		<div style="margin: 0px 20px 0px 0px; border: 1px solid;">
			<a href="$AbsoluteLink"><img border="0" src="$Image.SmallImage.AbsoluteURL" alt="Event Image"></a>
		</div>
		</td></tr>
		</table>
	<% end_with/loop%>
	<% end_if %>
	
	</td></tr>
</table>
<!-- Blog Post Info -->
<table style="margin: 10px 0px 10px 0px; background: #333; border: 1px solid #555; text-align: left;" width="600">
	<tr>
		<td valign="top">
			<div style="padding: 0px 0px 0px 5px;">
			<h2 style="color: #ffd520 !important; font-size: 30px; margin:0; padding:0;">$ImageHeading</h2>
			<% if Image %>
			  <div style="padding: 5px 0px;"><a href="$ImageLink">
				<% with/loopImage %>
			  	<% with/loopCroppedImage(250,187) %>
					<img src="$AbsoluteURL" alt="Recent Pics" border="0" alt="StudyBreak">
			 	<% end_with/loop%>
				<% end_with/loop%>
			  </a></div>
			<% end_if %>
		</td>
        		<td width="305" valign="top">
			<div style="padding: 0px 10px 0px 10px;">
			
			<h2 style="margin: 0px; padding: 0px; color: #FFD520 !important;">
				<a href="http://imu.uiowa.edu/blog/" target="_blank" style="display: block; text-decoration: none; color: #FFD520 !important; font-size: 30px; text-decoration: none; border: 0px; background-color: #333;  background-repeat: no-repeat; background-position: 200px; padding-right: 20px; margin-bottom: 5px;">from <span style="color: #ffea90; padding-bottom: 3px;">the blog</span></a>
			</h2>
			
				<h3 style="margin: 0px 0px 5px 0px;"><a href="$BlogLink" style="color: #ffea90; border-bottom: 1px dotted #FFD520; padding-bottom: 3px; text-decoration: none; background-color: #333; background-image: url('http://afterclass.uiowa.edu/themes/afterclass2/images/external_link_newsletter.png'); background-repeat: no-repeat; background-position: right; padding-right: 20px;">$BlogTitle</a></h3>
			</a>
			<div style="font-size: 14px; line-height: 20px; color: #fff;">$BlogIntro</div>
			<div style=""><a href="$BlogLink" style="display:block;margin: 10px 0px 10px 0px; color: #FFF; font-weight:bold;">Read more on our blog...</a></div>
			</div>
		</td>
		</tr>
</table>
<!-- About After Class -->
<table style="margin: 10px 0px 10px 0px; background: #333; border: 1px solid #555; text-align: left;" width="600">
	<tr>
		<td width="305" valign="top">
			<div style="padding: 0px 10px 10px 10px;">
			<h2 style="color: #FFD520 !important; font-size: 30px; margin:0; padding:0">about after class</h2>
			<p style="font-weight: normal; font-size: 15px; padding:0; margin:0; color: #FFF;">After Class, a project of the Division of Student Life at the University of Iowa,  brings you the best of campus culture, events, and nightlife - stuff to do "after class."</p>
			<h4 style="text-align: center; padding: 5px 0px 0px 0px; margin:0px; color: #FFD520 !important;">
				<a href="http://afterclass.uiowa.edu/" style="text-decoration: none; background-color: #2791AE; color: #fff; border: 1px solid #8f9ca1; display: block; width: 180px; height: 25px; padding: 7px 0px 0px 0px;">check out the site</a>
			</h4>
			</div>
		</td>
		<td valign="top">
			<h2 style="color: #FFD520 !important; font-size: 30px; margin:0; padding:0">promote your stuff</h2>
			<p style="font-weight: normal; font-size: 15px; padding:0; margin:0; color: #FFF;"> Use After Class to promote your event to a student audience! You can add your own events on the website</p>
			
			<h4 style="text-align: center; padding: 5px 0px 0px 0px; margin:0px;">
				<a href="http://afterclass.uiowa.edu/add" style="text-decoration: none; background-color: #2791AE; color: #fff; border: 1px solid #8f9ca1; display: block; width: 180px; height: 25px; padding: 7px 0px 0px 0px;">add your event</a>
			</h4>
		</td>
		</tr>
</table>

<!-- Bookstore Advertisement -->

<% if BookstoreImage %>
<table style="margin: 10px 0px 10px 0px; background: #333; border: 1px solid #555;" width="600">
	<tr><td>
		<a href="$BookstoreImageLink">
			<% with/loopBookstoreImage %>
			  <% with/loopCroppedImage(590,200) %>
				<img src="$AbsoluteURL" alt="Ad" border="0" alt="University Book Store">
			  <% end_with/loop%>
			<% end_with/loop%>
		</a>
	</td></tr>
</table>
<% end_if %>

<!-- DSL -->
<table style="margin: 10px 0px 10px 0px; background: #333; border: 1px solid #555;" width="600">
	<tr>
		<td width="305" valign="top">
			<div style="padding: 10px 10px 10px 10px;">
			<img src="http://hulk.imu.uiowa.edu/afterclass_dev/themes/afterclass2/images/dstack.png" style="margin: 0px 0px 10px 0px; width:250px;" alt="Division of Student Life">
			<!--ui_logo.png<img src="http://hulk.imu.uiowa.edu/afterclass_dev/themes/afterclass2/images/dsl_logo.png" width="250">-->
			</div>
		</td>
		<td valign="top">
			<div style="font-weight: normal;font-size: 15px; padding:0; margin:10px 10px 0px 0px; color:#FFF !important; text-align: right;">
				<h3 style="color: #fff !important;">after class</h3>
				319-335-3414<br />
				<a href="mailto:afterclass@uiowa.edu" style="color:#FFF;">afterclass@uiowa.edu</a>
			</div>
		</td>
		</tr><tr><td colspan="2">
		<div style="font-size: 14px; padding: 10px 10px 10px 10px; color: #fff !important;">
		Individuals with disabilities are encouraged to attend all University of Iowa events. If you are an individual with a disability who needs an accommodation, please contact the Division of Student life at 319-335-3414.<br />
		<br />
		<a href="*|UNSUB|*" style="color:#FFF !important;">Click here to unsubscribe</a>
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