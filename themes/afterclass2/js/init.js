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
    animation: "slide",
    controlNav: true,  
    directionNav: false,   
	});
	
	$('#facebook-like-box').sticky_div();

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

