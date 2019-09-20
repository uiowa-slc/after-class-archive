<table border="0" cellpadding="0" cellspacing="0" width="100%" class="mcnCaptionBlock" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
    <tbody class="mcnCaptionBlockOuter">
        <tr>
            <td class="mcnCaptionBlockInner" valign="top" style="padding: 9px;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                
<table border="0" cellpadding="0" cellspacing="0" class="mcnCaptionRightContentOuter" width="100%" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
    <tbody><tr>
        <td valign="top" class="mcnCaptionRightContentInner" style="padding: 0 9px;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
        
            <table align="left" border="0" cellpadding="0" cellspacing="0" class="mcnCaptionRightImageContentContainer" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">

                <tbody><tr>
                    <td class="mcnCaptionRightImageContent" valign="top" style="mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                    
                      
                        <a href="$AbsoluteLink" title="" class="" target="_self" style="word-wrap: break-word;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                        
						<% loop Image.SetWidth(200) %>
                        <img alt="$Title" src="$AbsoluteURL" width="176" style="max-width: 730px;border: 0;outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;vertical-align: bottom;" class="mcnImage">
						<% end_loop %>					
						</a>
                    </td>
                </tr>
            </tbody></table>
            <table class="mcnCaptionRightTextContentContainer" align="right" border="0" cellpadding="0" cellspacing="0" width="352" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                <tbody><tr>
                    <td valign="top" class="mcnTextContent" style="mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;color: #606060;font-family: Helvetica;font-size: 15px;line-height: 150%;text-align: left;">
                        <h3 style="margin: 0;padding: 0;display: block;font-family: Helvetica;font-size: 18px;font-style: normal;font-weight: bold;line-height: 125%;letter-spacing: -.5px;text-align: left;color: #606060 !important;"><a href="$AbsoluteLink" style="text-decoration: none;">$Title</a></h3>
						<p style="margin: 1em 0;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;color: #606060;font-family: Helvetica;font-size: 15px;line-height: 150%;text-align: left;">
							<p class="$FirstLast">
							
								<% include HeroDateTimes %>	
										
								<% if $DateAndTime.Count > "1" %>
											<a href="{$Link}#dates" class="button">more dates</a>
								<% end_if %>								
								<% if Venues %>
									<p class="$FirstLast"><strong> Location:</strong>
										<% if Location %>{$Location}<% end_if %>
										<% loop Venues %>
											$Title 			
											<% if Address %><a class="button" href="http://maps.apple.com/?q=$Address">Get Directions &raquo;</a>
										<% end_if %>
									</p>
										<% end_loop %>							
										<% end_if %>
										
							</p>
							
						</p>
						<div class="clear"></div>										
                    </td>
                </tr>
            </tbody></table>
        </td>
    </tr>
</tbody></table>
            </td>
        </tr>
    </tbody>
</table>