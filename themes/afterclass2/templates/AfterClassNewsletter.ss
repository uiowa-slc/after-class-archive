<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>After Class E-Newsletter</title>
</head>
<style type="text/css">
* {
  font-family: helvetica,arial,sans-serif;
}
html,body,td {
  font-family: helvetica, arial,sans-serif;
  font-size: 20px;
}
h1, h2, h3, h4, a {
	color:#2791a7;
	font-weight: bold;
}
h1 {
	font-size: 30px;
}
h2{
	font-size: 24px;
}
h3{
	font-size:20px;
}
h4{
	font-size: 17px;
}
ul li{
	list-style-type: square;
}
</style>
<body bgcolor="#fff" style="font-family: 'Helvetica Neue', helvetica, arial, sans-serif; color: white; padding: 0; margin:0;">
<div id="thebody" style="font-family: 'Helvetica Neue',helvetica, arial, sans-serif; color: #6F6E6E; background: #fff url(http://afterclass.uiowa.edu/assets/newsletter/paper.png);">
<center>

<table cellpadding="0" cellspacing="0" style="text-align:center;" width="100%" bgcolor="#1d1d1f">
<tbody>
<tr>
<td>
<div style="font-size: 11px;"><a href="{$AbsoluteLink}" style="color:#2791a7;margin: 2px 0px 5px 0px; text-decoration: none;">View this message in your browser.</a></div>
							<a href="http://afterclass.uiowa.edu"><img src="http://afterclass.uiowa.edu/assets/newsletter/afterclass_logo.png" alt="After Class" border="0"/></a>
</td>
</tr>
</tbody>
</table>
<!-- pseudo body table -->
<table border="0" cellpadding="0" cellspacing="0" bgcolor="transparent" width="99%">
	<tbody>
		<tr>
			<td align="center">
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
					<table cellpadding="0" cellspacing="0" width="600"  style="text-align: left;">
						<tbody>
						<tr style="border-style: solid;;"><td width="600" valign="top" style="">
						  <table cellpadding="10"><tr><td>
						  $Content
						  </td></tr></table>
						</td></tr>
<% if FeaturedEvent %>
<% control FeaturedEvent %>
						<tr width="598"  style="border-style: solid;">
							<td width="600" colspan="2" style="padding: 0px; margin:0px;">
								<center>
								<a href="$AbsoluteLink">
								<% control Image %>
			  					<% control CroppedImage(598,350) %>
									<img src="$AbsoluteURL" alt="Feature" border="0" alt="Featured Event">
			  					<% end_control %>
								<% end_control %>
								</a>
								</center>
								
								<h1 style="padding: 5px 5px 15px 15px; margin:0px; color:#2791a7; font-weight: bold; font-size:34px; ">$Title</h1>
								<table cellpadding="10"><tr><td>
								<table><tr><td width="600">
								<div style="padding:0; margin:0 0 10px 0; color: #6F6E6E; font-size:18px;">
									<span style="font-size: 18px; color:#2791a7; font-weight: bold;">Where:</span>
									$Location <% control Venues %><% if First %>$Title<% else %>, $Title<% end_if %><% end_control %>
								</div>
								<div style="padding:0; margin:0; color: #6F6E6E; font-size:18px;">
									<span style="font-size: 18px; color:#2791a7; font-weight: bold">When:</span>
									<% control UpcomingDates %> 
		    							<span style="color: #6F6E6E;">$StartDate.Format(D), $StartDate.Format(M). $StartDate.DayOfMonth</span>
		    							<% if StartTime %> at $StartTime.nice<% end_if %>
		    							<% if EndDate %> -
		    			 					<span style="color: #6F6E6E;">$EndDate.Format(D), $EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			 				<% end_if %> 
	    							<% end_control %>
	    						</div>
	    						</td><td valign="top">
									</td></tr></table><br />
								<div style="font-size:18px;padding:0; margin:0; color: #6F6E6E !important;">$Content.LimitWordCount(30)</div>
								</td></tr></table>
							</td>
						</tr>
												
						</tbody>						
					</table>
					
									<a href="$AbsoluteLink" style="text-decoration:none; padding:0; margin:10px 0px 0px 0px; color: #6F6E6E !important;">
									<table>
									<tr>
									<td width="590px">
									</td>
									<td width="110px">
									<h5  style="width:180px; height:33px; background-color:#2791AE; border-radius:10px; text-align:center; valign:center; font-size: 25px; color:#FFF !important; margin:0 40px 0 0;"> view event</h5></a>
									</td>
									</tr>
									</table>
<% end_control %>
<% end_if %>
<!-- main content ends -->

<!-- happening next/about section -->
<table cellpadding="0" cellspacing="0" border="0" style="margin-top: 10px; padding: 15px 10px 15px 10px;" width="600">
	<tr><td align="center">
	<% if Event1 %>
	<img src="http://afterclass.uiowa.edu/assets/newsletter/comingsoon.png" width="600">
	<% control Event1 %>
		<table style="padding: 15px 10px 15px 10px; text-align: left;">
		<tr width="550">
		<h1 style="width:100%; text-align:left; padding:0 0 0 12px; margin:20px 0 0 0; color: #2791a7 !important;"><a href="$AbsoluteLink" style="color: #2791a7 !important; font-size:30px; text-decoration: none;">$Title</a></h1>
		<% if Image %>
		<td width="200" valign="top">
		<div style="margin: 0px 20px 0px 0px; border: 1px solid;">
			<a href="$AbsoluteLink">
			<% control Image.SetWidth(200) %>
			<img border="0" src="$AbsoluteURL" alt="Event Image"></a>
			<% end_control %>
		</div>
		</td>
		<% end_if %>
		<td align="top">
		<% if Location %>
			<div style="padding:0; margin:0; color: #6F6E6E; font-size:18px;">
									<span style="font-size: 18px; color:#2791a7; font-weight: bold;">Where:</span>
									$Location <% control Venues %><% if First %>$Title<% else %>, $Title<% end_if %><% end_control %>
								</div>
								<% end_if %>
								<% if UpcomingDates %>
								<div style="padding:0; margin:0; color: #6F6E6E; font-size:18px;">
									<span style="font-size: 18px; color:#2791a7; font-weight: bold">When:</span>
									<% control UpcomingDates %> 
		    							<span style="color: #6F6E6E;">$StartDate.Format(D), $StartDate.Format(M). $StartDate.DayOfMonth</span>
		    							<% if StartTime %> at $StartTime.nice<% end_if %>
		    							<% if EndDate %> -
		    			 					<span style="color: #6F6E6E;">$EndDate.Format(D), $EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			 				<% end_if %> 
	    							<% end_control %>
	    						</div>
	    						<% end_if %>
	    						<br />
								<div style="font-size:18px;padding:0; margin:0; color: #6F6E6E !important;">$Content.LimitWordCount(17)</div>
		</td></tr>
		</table>
									<table>
									<tr>
									<td width="590px">
									</td>
									<td width="110px">
									<h5  style="width:180px; height:33px; background-color:#2791AE; border-radius:10px; text-align:center; valign:center; font-size: 25px; color:#FFF !important; margin:0 20px 0 0;"> view event</h5></a>
									</td>
									</tr>
									</table>
	<% end_control %>
	<% end_if %>
	<% if Event2 %>
	<% control Event2 %>
		<table style="padding: 15px 10px 15px 10px; text-align: left;">
		<tr width="550">
		<h1 style="width:100%; text-align:left; padding:0 0 0 12px; margin:20px 0 0 0; color: #2791a7 !important;"><a href="$AbsoluteLink" style="color: #2791a7 !important; font-size:30px; text-decoration: none;">$Title</a></h1>
		<% if Image %>
		<td width="200" valign="top">
		<div style="margin: 0px 20px 0px 0px; border: 1px solid;">
			<a href="$AbsoluteLink">
			<% control Image.SetWidth(200) %>
			<img border="0" src="$AbsoluteURL" alt="Event Image"></a>
			<% end_control %>
		</div>
		</td>
		<% end_if %>
		<td align="top">
		<% if Location %>
			<div style="padding:0; margin:0; color: #6F6E6E; font-size:18px;">
									<span style="font-size: 18px; color:#2791a7; font-weight: bold;">Where:</span>
									$Location <% control Venues %><% if First %>$Title<% else %>, $Title<% end_if %><% end_control %>
								</div>
								<% end_if %>
								<% if UpcomingDates %>
								<div style="padding:0; margin:0; color: #6F6E6E; font-size:18px;">
									<span style="font-size: 18px; color:#2791a7; font-weight: bold">When:</span>
									<% control UpcomingDates %> 
		    							<span style="color: #6F6E6E;">$StartDate.Format(D), $StartDate.Format(M). $StartDate.DayOfMonth</span>
		    							<% if StartTime %> at $StartTime.nice<% end_if %>
		    							<% if EndDate %> -
		    			 					<span style="color: #6F6E6E;">$EndDate.Format(D), $EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			 				<% end_if %> 
	    							<% end_control %>
	    						</div>
	    						<% end_if %>
	    						<br />
								<div style="font-size:18px;padding:0; margin:0; color: #6F6E6E !important;">$Content.LimitWordCount(17)</div>
		</td></tr>
		</table>
									<table>
									<tr>
									<td width="590px">
									</td>
									<td width="110px">
									<h5  style="width:180px; height:33px; background-color:#2791AE; border-radius:10px; text-align:center; valign:center; font-size: 25px; color:#FFF !important; margin:0 20px 0 0;"> view event</h5></a>
									</td>
									</tr>
									</table>
	<% end_control %>
	<% end_if %>
	<% if Event3 %>
	<% control Event3 %>
		<table style="padding: 15px 10px 15px 10px; text-align: left;">
		<tr width="550">
		<h1 style="width:100%; text-align:left; padding:0 0 0 12px; margin:20px 0 0 0; color: #2791a7 !important;"><a href="$AbsoluteLink" style="color: #2791a7 !important; font-size:30px; text-decoration: none;">$Title</a></h1>
		<% if Image %>
		<td width="200" valign="top">
		<div style="margin: 0px 20px 0px 0px; border: 1px solid;">
			<a href="$AbsoluteLink">
			<% control Image.SetWidth(200) %>
			<img border="0" src="$AbsoluteURL" alt="Event Image"></a>
			<% end_control %>
		</div>
		</td>
		<% end_if %>
		<td align="top">
		<% if Location %>
			<div style="padding:0; margin:0; color: #6F6E6E; font-size:18px;">
									<span style="font-size: 18px; color:#2791a7; font-weight: bold;">Where:</span>
									$Location <% control Venues %><% if First %>$Title<% else %>, $Title<% end_if %><% end_control %>
								</div>
								<% end_if %>
								<% if UpcomingDates %>
								<div style="padding:0; margin:0; color: #6F6E6E; font-size:18px;">
									<span style="font-size: 18px; color:#2791a7; font-weight: bold">When:</span>
									<% control UpcomingDates %> 
		    							<span style="color: #6F6E6E;">$StartDate.Format(D), $StartDate.Format(M). $StartDate.DayOfMonth</span>
		    							<% if StartTime %> at $StartTime.nice<% end_if %>
		    							<% if EndDate %> -
		    			 					<span style="color: #6F6E6E;">$EndDate.Format(D), $EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			 				<% end_if %> 
	    							<% end_control %>
	    						</div>
	    						<% end_if %>
	    						<br />
								<div style="font-size:18px;padding:0; margin:0; color: #6F6E6E !important;">$Content.LimitWordCount(17)</div>
		</td></tr>
		</table>
									<table>
									<tr>
									<td width="590px">
									</td>
									<td width="110px">
									<h5  style="width:180px; height:33px; background-color:#2791AE; border-radius:10px; text-align:center; valign:center; font-size: 25px; color:#FFF !important; margin:0 20px 0 0;"> view event</h5></a>
									</td>
									</tr>
									</table>
	<% end_control %>
	<% end_if %>
	<% if Event4 %>
	<% control Event4 %>
		<table style="padding: 15px 10px 15px 10px; text-align: left;">
		<tr width="550">
		<h1 style="width:100%; text-align:left; padding:0 0 0 12px; margin:20px 0 0 0; color: #2791a7 !important;"><a href="$AbsoluteLink" style="color: #2791a7 !important; font-size:30px; text-decoration: none;">$Title</a></h1>
		<% if Image %>
		<td width="200" valign="top">
		<div style="margin: 0px 20px 0px 0px; border: 1px solid;">
			<a href="$AbsoluteLink">
			<% control Image.SetWidth(200) %>
			<img border="0" src="$AbsoluteURL" alt="Event Image"></a>
			<% end_control %>
		</div>
		</td>
		<% end_if %>
		<td align="top">
		<% if Location %>
			<div style="padding:0; margin:0; color: #6F6E6E; font-size:18px;">
									<span style="font-size: 18px; color:#2791a7; font-weight: bold;">Where:</span>
									$Location <% control Venues %><% if First %>$Title<% else %>, $Title<% end_if %><% end_control %>
								</div>
								<% end_if %>
								<% if UpcomingDates %>
								<div style="padding:0; margin:0; color: #6F6E6E; font-size:18px;">
									<span style="font-size: 18px; color:#2791a7; font-weight: bold">When:</span>
									<% control UpcomingDates %> 
		    							<span style="color: #6F6E6E;">$StartDate.Format(D), $StartDate.Format(M). $StartDate.DayOfMonth</span>
		    							<% if StartTime %> at $StartTime.nice<% end_if %>
		    							<% if EndDate %> -
		    			 					<span style="color: #6F6E6E;">$EndDate.Format(D), $EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			 				<% end_if %> 
	    							<% end_control %>
	    						</div>
	    						<% end_if %>
	    						<br />
								<div style="font-size:18px;padding:0; margin:0; color: #6F6E6E !important;">$Content.LimitWordCount(17)</div>
		</td></tr>
		</table>
									<table>
									<tr>
									<td width="590px">
									</td>
									<td width="110px">
									<h5  style="width:180px; height:33px; background-color:#2791AE; border-radius:10px; text-align:center; valign:center; font-size: 25px; color:#FFF !important; margin:0 20px 0 0;"> view event</h5></a>
									</td>
									</tr>
									</table>
	<% end_control %>
	<% end_if %>
	<% if Event5 %>
	<% control Event5 %>
		<table style="padding: 15px 10px 15px 10px; text-align: left;">
		<tr width="550">
		<h1 style="width:100%; text-align:left; padding:0 0 0 12px; margin:20px 0 0 0; color: #2791a7 !important;"><a href="$AbsoluteLink" style="color: #2791a7 !important; font-size:30px; text-decoration: none;">$Title</a></h1>
		<% if Image %>
		<td width="200" valign="top">
		<div style="margin: 0px 20px 0px 0px; border: 1px solid;">
			<a href="$AbsoluteLink">
			<% control Image.SetWidth(200) %>
			<img border="0" src="$AbsoluteURL" alt="Event Image"></a>
			<% end_control %>
		</div>
		</td>
		<% end_if %>
		<td align="top">
		<% if Location %>
			<div style="padding:0; margin:0; color: #6F6E6E; font-size:18px;">
									<span style="font-size: 18px; color:#2791a7; font-weight: bold;">Where:</span>
									$Location <% control Venues %><% if First %>$Title<% else %>, $Title<% end_if %><% end_control %>
								</div>
								<% end_if %>
								<% if UpcomingDates %>
								<div style="padding:0; margin:0; color: #6F6E6E; font-size:18px;">
									<span style="font-size: 18px; color:#2791a7; font-weight: bold">When:</span>
									<% control UpcomingDates %> 
		    							<span style="color: #6F6E6E;">$StartDate.Format(D), $StartDate.Format(M). $StartDate.DayOfMonth</span>
		    							<% if StartTime %> at $StartTime.nice<% end_if %>
		    							<% if EndDate %> -
		    			 					<span style="color: #6F6E6E;">$EndDate.Format(D), $EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			 				<% end_if %> 
	    							<% end_control %>
	    						</div>
	    						<% end_if %>
	    						<br />
								<div style="font-size:18px;padding:0; margin:0; color: #6F6E6E !important;">$Content.LimitWordCount(17)</div>
		</td></tr>
		</table>
									<table>
									<tr>
									<td width="590px">
									</td>
									<td width="110px">
									<h5  style="width:180px; height:33px; background-color:#2791AE; border-radius:10px; text-align:center; valign:center; font-size: 25px; color:#FFF !important; margin:0 20px 0 0;"> view event</h5></a>
									</td>
									</tr>
									</table>
	<% end_control %>
	<% end_if %>
	
	</td></tr>
</table>
<!-- Blog Post Info -->
<% if BlogTitle %>
<img src="http://afterclass.uiowa.edu/assets/newsletter/fromtheblog.png" width="600" style="margin-bottom:10px;">
<table style="margin: 10px 0px 10px 0px; text-align: left;" width="600">
				<tr>
			<% if Image %>
			  <div style="padding: 5px 0px;"><a href="$ImageLink">
				<% control Image %>
			  	<% control SetRatioSize(600,600) %>
					<img src="$AbsoluteURL" alt="Recent Pics" border="0" alt="StudyBreak">
			 	<% end_control %>
				<% end_control %>
			  </a></div>
			<% end_if %>
			
				<h1 style="margin: 10px 0px 15px 10px; font-size:34px;"><a href="$BlogLink" style="color: #2791a7; padding-bottom: 3px; text-decoration: none;">$BlogTitle</a></h1>
				</tr>
	<tr>
        		<td valign="top">
			<div style="padding: 0px 10px 0px 10px;">
			</a>
			<div style="font-size: 20px; line-height: 20px; color: #6F6E6E;">$BlogIntro</div>
			<div style=""><a href="$BlogLink" style="display:block;margin: 10px 0px 10px 0px; color: #2791a7; font-weight:bold;">Read more on our blog...</a></div>
			</div>
		</td>
		</tr>
</table>
<% end_if %>

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

<!-- About After Class -->
<img src="http://afterclass.uiowa.edu/assets/newsletter/aboutus.png" width="600" style="margin-bottom:10px;">
<table style="margin: 10px 0px 10px 0px; text-align: left;" width="600">
	<tr>
		<td width="305" valign="top">
			<div style="padding: 0px 10px 10px 10px;">
			<h2 style="color:#2791a7 !important; font-size: 30px; margin:0; padding:0;">About After Class</h2>
			<p style="font-weight: normal; font-size: 15px; padding:0; margin:10px 0 10px 0;">After Class is a Division of Student Life initiative meant to bring you great opportunities to be entertained, get involved, and enjoy student life at Iowa.</p>

			</div>
		</td>
		<td valign="top">
			<h2 style="color: #2791a7 !important; font-size: 30px; margin:0; padding:0">List Your Event</h2>
			<p style="font-weight: normal; font-size: 15px; padding:0; margin:10px 0 10px 0;">Promote your events on After Class to a student audience! Submit your information at the website today.</p>
			

		</td>
		</tr>
		<tr>
			<td valign="top" align="center">
				<h4 style="text-align: center; padding: 5px 0px 0px 0px; margin:0px; color: #FFD520 !important;">
					<a href="http://afterclass.uiowa.edu/" style="text-decoration: none; background-color: #2791AE; color: #fff; display: block; width: 180px; height: 29px; padding: 7px 0px 0px 0px; border-radius:10px;">visit the site</a>
				</h4>
			</td>
		
			<td valign="top" align="center">
				<h4 style="text-align: center; padding: 5px 0px 0px 0px; margin:0px;">
					<a href="http://afterclass.uiowa.edu/add" style="text-decoration: none; background-color: #2791AE; color: #fff; display: block; width: 180px; height: 29px; padding: 7px 0px 0px 0px; border-radius:10px;">add your event</a>
				</h4>
			</td>
</table>
<!-- Bookstore Advertisement -->

<% if BookstoreImage %>
<table style="margin: 20px 0px 30px 0px;" width="600">
	<tr><td>
		<a href="$BookstoreImageLink">
			<% control BookstoreImage %>
			  <% control CroppedImage(590,200) %>
				<img src="$AbsoluteURL" alt="Ad" border="1px" alt="University Book Store">
			  <% end_control %>
			<% end_control %>
		</a>
	</td></tr>
</table>
<% end_if %>
<!-- DSL -->
<table style="width:100%;" bgcolor="#1d1d1f">
<tr>
<td>
<table style="margin: 0 auto;" width="600px">
	<tr>
		<td width="305" valign="top">
			<div style="padding: 10px 10px 10px 10px;">
			<a href="http://studentlife.uiowa.edu"><img src="http://afterclass.uiowa.edu/themes/afterclass2/images/dstack.png" style="margin: 0px 0px 10px 0px; width:250px;" alt="Division of Student Life"></a>
			</div>
		</td>
		<td valign="top">
			<div style="font-weight: normal;font-size: 15px; padding:0; margin:10px 10px 0px 0px; color:#FFF !important; text-align: right;">
				<h1 style="color: #E8CA66 !important;"><a href="http://afterclass.uiowa.edu">after class</a></h1>
				319-335-3414<br />
				<a href="mailto:afterclass@uiowa.edu" style="color:#E8CA66;">afterclass@uiowa.edu</a>
			</div>
		</td>
		</tr><tr><td colspan="2">
		<div style="font-size: 17px; padding: 10px 10px 10px 10px; color: #fff !important;">
		Individuals with disabilities are encouraged to attend all University of Iowa events. If you are an individual with a disability who needs an accommodation, please contact the Division of Student life at 319-335-3414.<br />
		<br />
		<a href="*|UNSUB|*" style="color:#E8CA66 !important;">Unsubscribe</a>
		</div>
		</td></tr>
</table>
</td>
</tr>
</table>

</center>
</div>
</body>
</html>