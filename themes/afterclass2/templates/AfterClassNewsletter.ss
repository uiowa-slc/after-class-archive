<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>After Class E-Newsletter</title>
</head>
<body bgcolor="#47354c" style="background-image:url(http://news.imu.uiowa.edu/assets/AfterClassNewsletter/background.jpg); font-family: Verdana, helvetica, sans-serif; color: white">
<center>

<!-- pseudo body table -->
<table border="0" cellpadding="0" cellspacing="0" bgcolor="transparent" width="99%">
	<tbody>
		<tr>
			<td align="center">
<div style="font-size: 11px;"><a href="/" style="color:#CCC;margin: 2px 0px 5px 0px; text-decoration: none;">View this message in your browser.</a></div>
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
<% control FeaturedEvent %>
					<table cellpadding="0" cellspacing="0" width="600" bgcolor="#221e23">
						<tbody>
						
						<tr>
							<td width="600" colspan="2" height="215" valign="top"><a href="http://afterclass.uiowa.edu"><img src="http://news.imu.uiowa.edu/assets/AfterClassNewsletter/afterclass-header.jpg"/></a>
							</td>
						</tr>
						
						
						<tr width="598" bgcolor="#2791ae" style="border-style: solid; border-weight: 1px; border-color:#8f9ca1" >
							<td width="470" colspan="2" style="padding: 0px; margin:0px; padding-left: 10px; border-left: 1px solid #8f9ca1; border-top: 1px solid #8f9ca1; border-bottom: 1px solid #8f9ca1">
								<h1 style="padding: 5px 0px; margin:0px; color:white; text-transform: uppercase; font-weight: bold; font-size:24px">$Title</h1>
							</td>
						</tr>
						
						
						<tr>
							<td colspan="2" style="margin:0;padding:0">
							$Image.CroppedImage(600,350)
							</td>
						</tr>
						<tr cellpadding="0" cellspacing="0">
							<td colspan="2" style="border-top: 1px solid #8f9ca1; border-right: 1px solid #8f9ca1; border-left: 1px solid #8f9ca1; padding-top: 8px; padding-right: 8px; padding-left: 8px">
								<p style="padding:0; margin:0"> <span style="font-size: 18px;text-transform: uppercase; color:#ffd520; font-weight: normal;">Where?</span> $Location <% control Venues %><% if First %>$Title<% else %>, $Title<% end_if %><% end_control %></p>
								<p style="padding:0; margin:0"> <span style="font-size: 18px; text-transform: uppercase; color:#ffd520; font-weight: normal">When?</span>
								<% control DateAndTime %> 
		    						<span>$StartDate.Format(D), $StartDate.Format(M). $StartDate.DayOfMonth</span>
		    						<% if StartTime %> at $StartTime.nice<% end_if %>
		    					<% if EndDate %> -
		    			 			<span>$EndDate.Format(D), $EndDate.Format(M). $EndDate.DayOfMonth</span>
		    			 			<% end_if %> 
	    						<% end_control %></p>
								<p style="font-size:12px;padding:0; margin:0"> $Content<p>
							</td>
						</tr>
						
						
						<tr style="padding:0; margin:0" cellpadding="0" cellspacing="0" >
							<td colspan="2" style="border-bottom: 1px solid #8f9ca1; border-right: 1px solid #8f9ca1; border-left: 1px solid #8f9ca1;padding-left: 8px; padding-bottom: 8px; margin:0">
							<a href="$AbsoluteLink" style="text-decoration:none;padding:0; margin:0"><h5  style="width:110px; height:25px; background-color:#ffd520; text-align:center; valign:center; border: 1px solid #8f9ca1; color:#221e23; padding-top:5px;margin:0; "> view event</h5></a>
							</td>
						</tr>
						
						
						</tbody>						
					</table>
<% end_control %>
<!-- main content ends -->

<!-- happening next/about section -->
					<table cellpadding="0" cellspacing="0" border="0" style="margin-top: 30px" width="600">
						<tbody >
						<tr cellpadding="0" cellspacing="0" colspan="2" style="margin:0; padding:0">
						<!-- happening next column -->
							<td cellpadding="0" cellspacing="0" style="margin:0; padding:0" valign="top">
								<table cellpadding="0" cellspacing="0" width="260">
									<tr>
										<td>
											
											<table border="0" cellpadding="0" cellspacing="0"  bgcolor="#221E23" style="margin:0; padding:0; border:1px solid #8f9ca1">
												<tbody style="margin:0; padding:0">
												<tr style="background-color:#2791ae; width:240px; margin:0; padding:0" >
													<td colspan="2" valign="top" style="margin:0; padding:0; width:300px">
													<h2 style="margin:0; padding:8px; text-transform: uppercase; font-weight: bold; font-size: 24px">Happening Next</h2>
													</td>
												</tr>
						<!-- individual upcoming event -->
											<% if Event1 %>
											<% control Event1 %>
												<tr>
													<td style="padding:8px">
													<div style="font-weight:normal; font-size: 18px; margin:0; padding:0">$Title</div>
													<div style="font-size: 12px;">Mar. 22 - Mar. 24</div>
													<div style="font-size: 12px;">10:00pm</div>
													</td>
												</tr>
												<tr>
													<td style="border-bottom: 1px solid #ffd520; padding: 8px;"><a href="$AbsoluteLink" style="text-decoration:none;padding:0; margin:0;"><h5  style="width:300px; height:25px; background-color:#ffd520; text-align:center; valign:center; border: 1px solid #8f9ca1; color:#221e23; padding-top:7px;margin:0; "> view event</h5></a></td>
												</tr>
											<% end_control %>
											<% end_if %>
						<!-- end event -->
						<!-- individual upcoming event -->
											<% if Event2 %>
											<% control Event2 %>
												<tr>
													<td style="padding:8px">
													<div style="font-weight:normal; font-size: 18px; margin:0; padding:0">$Title</div>
													<div style="font-size: 12px;">Mar. 22 - Mar. 24</div>
													<div style="font-size: 12px;">10:00pm</div>
													</td>
												</tr>
												<tr>
													<td style="border-bottom: 1px solid #ffd520; padding: 8px;"><a href="$AbsoluteLink" style="text-decoration:none;padding:0; margin:0;"><h5  style="width:300px; height:25px; background-color:#ffd520; text-align:center; valign:center; border: 1px solid #8f9ca1; color:#221e23; padding-top:7px;margin:0; "> view event</h5></a></td>
												</tr>
											<% end_control %>
											<% end_if %>
						<!-- end event -->
						<!-- individual upcoming event -->
											<% if Event3 %>
											<% control Event3 %>
												<tr>
													<td style="padding:8px">
													<div style="font-weight:normal; font-size: 18px; margin:0; padding:0">$Title</div>
													<div style="font-size: 12px;">Mar. 22 - Mar. 24</div>
													<div style="font-size: 12px;">10:00pm</div>
													</td>
												</tr>
												<tr>
													<td style="border-bottom: 1px solid #ffd520; padding: 8px;"><a href="$AbsoluteLink" style="text-decoration:none;padding:0; margin:0;"><h5  style="width:300px; height:25px; background-color:#ffd520; text-align:center; valign:center; border: 1px solid #8f9ca1; color:#221e23; padding-top:7px;margin:0; "> view event</h5></a></td>
												</tr>
											<% end_control %>
											<% end_if %>
						<!-- end event -->
						<!-- individual upcoming event -->
											<% if Event4 %>
											<% control Event4 %>
												<tr>
													<td style="padding:8px">
													<div style="font-weight:normal; font-size: 18px; margin:0; padding:0">$Title</div>
													<div style="font-size: 12px;">Mar. 22 - Mar. 24</div>
													<div style="font-size: 12px;">10:00pm</div>
													</td>
												</tr>
												<tr>
													<td style="border-bottom: 1px solid #ffd520; padding: 8px;"><a href="$AbsoluteLink" style="text-decoration:none;padding:0; margin:0;"><h5  style="width:300px; height:25px; background-color:#ffd520; text-align:center; valign:center; border: 1px solid #8f9ca1; color:#221e23; padding-top:7px;margin:0; "> view event</h5></a></td>
												</tr>
											<% end_control %>
											<% end_if %>
						<!-- end event -->
						<!-- individual upcoming event -->
											<% if Event5 %>
											<% control Event5 %>
												<tr>
													<td style="padding:8px">
													<div style="font-weight:normal; font-size: 18px; margin:0; padding:0">$Title</div>
													<div style="font-size: 12px;">Mar. 22 - Mar. 24</div>
													<div style="font-size: 12px;">10:00pm</div>
													</td>
												</tr>
												<tr>
													<td style="border-bottom: 1px solid #ffd520; padding: 8px;"><a href="$AbsoluteLink" style="text-decoration:none;padding:0; margin:0;"><h5  style="width:300px; height:25px; background-color:#ffd520; text-align:center; valign:center; border: 1px solid #8f9ca1; color:#221e23; padding-top:7px;margin:0; "> view event</h5></a></td>
												</tr>
											<% end_control %>
											<% end_if %>
						<!-- end event -->											
						
						
												</tbody>
											</table>
										</td>
									</tr>
								</table>
							</td>
						<!-- about column -->	
							<td cellpadding="0" cellspacing="0" style="margin:0; padding:0" valign="top" width="330">
								<table style="margin-left:10px;">
									<tr>
										<td>
										<h2 style="color:#ffd520; font-size: 30px; margin:0; padding:0">about after class</h2>
										<p style="font-weight: normal;font-size: 15px; padding:0, margin:0">After Class, a project of the Division of Student Life at the University of Iowa,  brings you the best of campus culture, events, and nightlife - stuff to do "after class."</p>
										</td>
									</tr>
									
									<tr>
										<td>
										<a href="#" style="text-decoration:none; color: white"><h4 style="text-align: center; padding-top:10px;margin:0; background-color:#2791ae; width: 180px; height: 30px; border: 1px solid #8f9ca1">check out the site</h4></a>
										</td>
									</tr>
									
									<tr>
										<td>
										<p style="font-weight: normal;font-size: 15px; padding:0, margin:0"> Use After Class to promote your event to a student audience! You can add your own events on the website</p>
										</td>
									</tr>
									
									<tr>
										<td>
										<a href="#" style="text-decoration:none; color: white"><h4 style="text-align: center; padding-top:10px; margin-bottom:20px; margin-top:0; background-color:#2791ae; width: 180px; height: 30px; border: 1px solid #8f9ca1">add your event</h4></a>
										</td>
									</tr>
									
								</table>
								
				<!-- social media/division logo box -->
								<table border="0" cellpadding="0" cellspacing="0" width="306" bgcolor="#221E23" style="margin-left:10px">
									<tbody>
										<tr colspan:"4" >
											<td style="border-top:1px solid #8f9ca1; border-left:1px solid #8f9ca1; width:24px; height:24px; padding-left:8px; padding-top: 8px">
											<a href="#"><img src="http://news.imu.uiowa.edu/assets/AfterClassNewsletter/google-plus.png"style="width:24px; height:24px"/></a>
											</td>
											<td style="border-top:1px solid #8f9ca1;width:24px; height:24px;padding-left:8px; padding-top: 8px">
											<a href="http://www.facebook.com/pages/After-Class/319621914746674"><img src="http://news.imu.uiowa.edu/assets/AfterClassNewsletter/facebook.png" style="width:24px; height:24px"/></a>
											</td>
											<td style="border-top:1px solid #8f9ca1;width:24px; height:24px;padding-left:8px; padding-top: 8px">
											<a href="http://twitter.com/#!/uiafterclass"><img src="http://news.imu.uiowa.edu/assets/AfterClassNewsletter/twitter.png"style="width:24px; height:24px"/></a>
											</td>
											<td width="232" style="border-top:1px solid #8f9ca1; border-right: 1px solid #8f9ca1">
											
											</td>
											
										</tr>
										<tr colspan="4">
											<td colspan="4" style="border-left:1px solid #8f9ca1; border-right:1px solid #8f9ca1; border-bottom: 1px solid #8f9ca1">
											<% if Image %><div style="padding: 8px 10px;"><a href="$ImageLink">$Image.CroppedImage(200,150)</a></div><% end_if %>
											
											<a href="http://studentlife.uiowa.edu/"><img src="http://news.imu.uiowa.edu/assets/AfterClassNewsletter/division-of-student-life.png" style="margin:20px"/></a>
											<a href="afterclass.uiowa.edu" style="text-decoration: none; color: white;"><h4 style="margin-left:10px; margin-bottom:10px; margin-top:0">afterclass.uiowa.edu</h4></a>
											
											</td>
											
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						</tbody>
					</table>

<!-- happening next/aboutsection ends-->				
				
				<table cellpadding="0" cellspacing="0" width="600" bgcolor="#221e23" style="margin-top: 30px;">
				<tbody><tr><td style="border: 1px solid #8f9ca1; padding: 8px; font-size: 11px; text-align: center;">
				Individuals with disabilities are encouraged to attend all University of Iowa events. If you are an individual with a disability who needs an accomodation, please contact the Division of Student life at 319-335-3117.<br />
				<br />
				<a href="" style="color:#FFF;">Click Here to Unsubscribe</a>
				</td></tr></tbody></table>
				
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
</body>
</html>