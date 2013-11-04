jQuery(document).ready(function ($) {
	/* $('#feedback-link').fancybox({
	 	padding: 0
	 });
	 $('.subscribe-link').fancybox({
	 	padding: 0,
	 	autoSize: false,
	 	width: "80%",
	 	height: "20%",
	 });
	 $('.report-problem-link').fancybox({
	 	padding: 0
	 });*/
	 
	 $(".secondary-nav").hide();
	// $("#calendar-expand").inner
	$("#canvas").height($("#page_header").height());
	$("#canvas").width($("#page_header").width()/2);
	$('.flexslider').flexslider({
	selector: ".slides > .slide",
touch: false,   
    animation: "slide",
    controlNav: true,  
    directionNav: false,   
	});
	
	var stickyDivOptions = {
	  top: 0, // This represents the buffer you want between the top of the page and the div in px. Default is 0.
	  min_screen_width: 0, // This represents the minimum screen width that the stickiness will be applied to. Default is 0.
	  bottom: 0, // This represents the buffer you want between the bottom of the page and the div in px. Default is 0.
	  outer_div: null // This is a jquery or DOM element whose height needs to be greater than the div in order to make it sticky. Default is null.
	  
	};
	/* $('#facebook-like-box').sticky_div(stickyDivOptions); */

	$("#calendar-expand").click(function() {
	  		if($(".secondary-nav").css('display') == 'none'){
		  		$("#calendar-expand").addClass("active");
	  		}else{	
		  		$("#calendar-expand").removeClass("active");
	  		}
	  		$(".secondary-nav").toggle();
	  		return false;
	  
	});	
	
});

