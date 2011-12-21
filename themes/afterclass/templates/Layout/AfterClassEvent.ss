<!--<header id="detail_header"><h1>Movies</h1></header>-->

<section id="detail_feature" class="feature clearfix">
    	   	<img src="$Image.LargeImage.URL" class="detail_feature_image"/>
    	   	<div class="event_group">
    	   	<div class="event_text">
    		<h2><strong>$Title</strong></h2>
    		<p class="event_details">
    		
    			<% control DateAndTime %>$StartDate.format(M). $StartDate.format(d) at $StartTime.nice<br /><% end_control %>
    			
    			<br />
            	$Location<br/>
            	$Cost</p>           
       	</div>
       	
       	<div class="event_date_tag">
       		<a href="#">
       		<% control DateAndTime %>
			<% if First %>
			<div class="event_date_box">$StartDate.format(M) <strong>$StartDate.format(d)</strong> $StartDate.format(D)</div>
			<% end_if %>
        	<% end_control %>
       		</a>
            <ul>
            	<li class="share_facebook"><a href="#">Facebook</a></li>
                <li class="share_rss"><a href="#">RSS</a></li>
                <li class="share_twitter"><a href="#">Twitter</a></li>
                <li class="share_email"><a href="#">Email</a></li>
            </ul>
        </div>       
    
			</div>
		<!--<div id="detail_carousel">
			<div class="carousel_thumb">
			<a href="#"><img src="http://dummyimage.com/96x81"/></a>
			</div>
			<div class="carousel_thumb">
			<a href="#"><img src="http://dummyimage.com/96x81"/></a>
			</div>
			<div class="carousel_thumb">
			<a href="#"><img src="http://dummyimage.com/96x81"/></a>
			</div>
			<div class="carousel_thumb_last">
			<a href="#"><img src="http://dummyimage.com/96x81"/></a>
			</div>
		</div>-->
		
    </section>


<section id="detail_event_description">
	<h2>Event Description</h2>
	$Content
	
	<h2>Map of Location</h2>
	<img src="http://dummyimage.com/840x450" class="detail_map"/>
</section>


<section id="detail_related_events">
	<h2>Related Events</h2>
	<div class="related_event">
		<a href="#"><img src="http://dummyimage.com/201x170"/>
		<h3><strong>Kenan Thompson</strong> @ Hubbard Park</h3></a>
	</div>
	<div class="related_event">
		<a href="#"><img src="http://dummyimage.com/201x170"/>
		<h3><strong>Kenan Thompson</strong> @ Hubbard Park</h3></a>
	</div>
	<div class="related_event">
		<a href="#"><img src="http://dummyimage.com/201x170"/>
		<h3><strong>Kenan Thompson</strong> @ Hubbard Park</h3></a>
	</div>
	<div class="related_event">
		<a href="#"><img src="http://dummyimage.com/201x170"/>
		<h3><strong>Kenan Thompson</strong> @ Hubbard Park</h3></a>
	</div>
</section>


