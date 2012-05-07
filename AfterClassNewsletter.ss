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
<!-- previously featured event control-->
						<tr width="598" bgcolor="#444" style="border-style: solid; border-weight: 1px; border-color:#8f9ca1">
							<td width="600" colspan="2" style="padding: 0px; margin:0px; border: 1px solid #8f9ca1;">
								
                                
                                <!-- Blog Post Info -->
<table style="margin: 10px 0px 10px 0px; background: #333; border: 1px solid #555; text-align: left;" width="600">
	<tr>
		<td valign="top">
			<div style="padding: 0px 0px 0px 5px;">
			<h2 style="color: #ffd520 !important; font-size: 30px; margin:0; padding:0;">$ImageHeading</h2>
			<% if Image %>
			  <div style="padding: 5px 0px;"><a href="$ImageLink">
				<% control Image %>
			  	<% control CroppedImage(250,187) %>
					<img src="$AbsoluteURL" alt="Recent Pics" border="0" alt="StudyBreak">
			 	<% end_control %>
				<% end_control %>
			  </a></div>
			<% end_if %>
		</td>
        		<td width="305" valign="top">
			<div style="padding: 0px 10px 0px 10px;">
			
			<h2 style="margin: 0px; padding: 0px; color: #FFD520 !important;">
				<a href="http://imu.uiowa.edu/blog/" style="text-decoration: none; color: #FFD520 !important; font-size: 30px; text-decoration: none; border: 0px;">from the blog</a>
			</h2>
			<a href="$BlogLink" style="text-decoration: none; color: #FFF !important;">
				<h3 style="margin: 0px 0px 5px 0px;">$BlogTitle</h3>
			</a>
			<div style="font-size: 14px; line-height: 20px; color: #fff;">$BlogIntro</div>
			<div style=""><a href="$BlogLink" style="display:block;margin: 10px 0px 10px 0px; color: #FFF; font-weight:bold;">Read more on our blog...</a></div>
			</div>
		</td>
		</tr>
</table>
                                
							</td>
						</tr>
                        
<tr width="598" bgcolor="#444" style="border-style: solid; border-weight: 1px; border-color:#8f9ca1">
							<td width="600" colspan="2" style="padding: 0px; margin:0px; border: 1px solid #8f9ca1;">
                        <h2 style="color: #ffd520 !important; font-size: 30px; margin:0; padding:0;">social media</h2>
						</td>
						</tr>
        										
						</tbody>						
					</table>
<!-- previously featured event end control-->
<!-- main content ends -->

<!-- happening next/about section -->
<table cellpadding="0" cellspacing="0" border="0" style="margin-top: 10px; padding: 15px 10px 15px 10px;" width="600">
	<tr><td align="center">
	<img src="http://afterclass.uiowa.edu/themes/afterclass2/images/coming_soon.png" width="500">
	<% if Event1 %>
	<% control Event1 %>
		<table bgcolor="#323232" style="border: 1px solid #555; padding: 15px 10px 15px 10px; text-align: left;">
		<tr width="550"><td width="400" valign="top">
		<h3 style="padding:0px 0px 10px 0px; margin:0px; color: #FFF5D1 !important;"><a href="$AbsoluteLink" style="color: #FFF5D1 !important; font-size:24px; text-decoration: none;">$Title</a></h3>
			<div style="font-size: 16px; color: #fff !important;">
				<% control DateAndTime %> 
		    		<span>$StartDate.Format(D), $StartDate.Format(M). $StartDate.DayOfMonth</span>
		    			<% if EndDate %> -
		    				<span>$EndDate.Format(D), $EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			<% end_if %> 
	    		<% end_control %> at <% control Venues %>$Title<% end_control %>
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
	<% end_control %>
	<% end_if %>
	<% if Event2 %>
	<% control Event2 %>
		<table bgcolor="#292929" style="border: 1px solid #555; padding: 15px 10px 15px 10px; text-align: left;">
		<tr width="550"><td width="400" valign="top">
		<h3 style="padding:0px 0px 10px 0px; color: #FFF5D1 !important; margin:0px;"><a href="$AbsoluteLink" style="color:#FFF5D1 !important; font-size:24px; text-decoration: none;">$Title</a></h3>
			<div style="font-size: 16px; color: #fff !important;">
				<% control DateAndTime %>
		    		<span>$StartDate.Format(D), $StartDate.Format(M). $StartDate.DayOfMonth</span>
		    			<% if EndDate %> -
		    				<span>$EndDate.Format(D), $EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			<% end_if %>
	    		<% end_control %> at <% control Venues %>$Title<% end_control %>
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
	<% end_control %>
	<% end_if %>
	<% if Event3 %>
	<% control Event3 %>
		<table bgcolor="#323232" style="border: 1px solid #555; padding: 15px 10px 15px 10px; text-align: left;">
		<tr width="550"><td width="400" valign="top">
		<h3 style="padding:0px 0px 10px 0px; color: #FFF5D1 !important; margin:0px;"><a href="$AbsoluteLink" style="color:#FFF5D1 !important; font-size:24px; text-decoration: none;">$Title</a></h3>
			<div style="font-size: 16px; color: #fff !important;">
				<% control DateAndTime %> 
		    		<span>$StartDate.Format(D), $StartDate.Format(M). $StartDate.DayOfMonth</span>
		    			<% if EndDate %> -
		    				<span>$EndDate.Format(D), $EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			<% end_if %> 
	    		<% end_control %> at <% control Venues %>$Title<% end_control %>
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
	<% end_control %>
	<% end_if %>
	<% if Event4 %>
	<% control Event4 %>
		<table bgcolor="#292929" style="border: 1px solid #555; padding: 15px 10px 15px 10px; text-align: left;">
		<tr width="550"><td width="400" valign="top">
		<h3 style="padding:0px 0px 10px 0px; color: #FFF5D1 !important; margin:0px;"><a href="$AbsoluteLink" style="color:#FFF5D1 !important; font-size:24px; text-decoration: none;">$Title</a></h3>
			<div style="font-size: 16px; color: #fff !important;">
				<% control DateAndTime %>
		    		<span>$StartDate.Format(D), $StartDate.Format(M). $StartDate.DayOfMonth</span>
		    			<% if EndDate %> -
		    				<span>$EndDate.Format(D), $EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			<% end_if %>
	    		<% end_control %> at <% control Venues %>$Title<% end_control %>
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
	<% end_control %>
	<% end_if %>
	<% if Event5 %>
	<% control Event5 %>
		<table bgcolor="#323232" style="border: 1px solid #555; padding: 15px 10px 15px 10px; text-align: left;">
		<tr width="550"><td width="400" valign="top">
		<h3 style="padding:0px 0px 10px 0px; color: #FFF5D1 !important; margin:0px;"><a href="$AbsoluteLink" style="color:#FFF5D1 !important; font-size:24px; text-decoration: none;">$Title</a></h3>
		<div style="font-size: 16px; color: #fff !important;">
				<% control DateAndTime %> 
		    		<span>$StartDate.Format(D), $StartDate.Format(M). $StartDate.DayOfMonth</span>
		    			<% if EndDate %> -
		    				<span>$EndDate.Format(D), $EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			<% end_if %> 
	    		<% end_control %> at <% control Venues %>$Title<% end_control %>
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
	<% end_control %>
	<% end_if %>
	
	</td></tr>
</table>
<!-- blog previously here-->
<!-- About After Class -->
<table style="margin: 10px 0px 10px 0px; background: #333; border: 1px solid #555; text-align: left;" width="600">
	<tr>
		<td width="305" valign="top">
			<div style="padding: 0px 10px 10px 10px;">
			<h2 style="color: #FFD520 !important; font-size: 30px; margin:0; padding:0">about after class</h2>
			<p style="font-weight: normal; font-size: 15px; padding:0; margin:0; color: #FFF;">After Class, a project of the Division of Student Life at the University of Iowa,  brings you the best of campus culture, events, and nightlife - stuff to do "after class."</p>
			<h4 style="text-align: center; padding: 5px 0px 0px 0px; margin:0px; color: #FFD520 !important;">
				<a href="http://afterlcass.uiowa.edu/" style="text-decoration: none; background-color: #2791AE; color: #fff; border: 1px solid #8f9ca1; display: block; width: 180px; height: 25px; padding: 7px 0px 0px 0px;">check out the site</a>
			</h4>
			</div>
		</td>
		<td valign="top">
			<h2 style="color: #FFD520 !important; font-size: 30px; margin:0; padding:0">promote your stuff</h2>
			<p style="font-weight: normal; font-size: 15px; padding:0; margin:0; color: #FFF;"> Use After Class to promote your event to a student audience! You can add your own events on the website</p>
			
			<h4 style="text-align: center; padding: 5px 0px 0px 0px; margin:0px;">
				<a href="http://afterlcass.uiowa.edu/add" style="text-decoration: none; background-color: #2791AE; color: #fff; border: 1px solid #8f9ca1; display: block; width: 180px; height: 25px; padding: 7px 0px 0px 0px;">add your event</a>
			</h4>
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
				<img src="$AbsoluteURL" alt="Ad" border="0" alt="University Book Store">
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