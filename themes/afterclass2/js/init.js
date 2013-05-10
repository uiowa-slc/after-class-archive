jQuery(document).ready(function ($) {
	 $('#feedback-link').fancybox({
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
	 });
	 
	 $(".secondary-nav").hide();
	// $("#calendar-expand").inner
	$("#canvas").height($("#page_header").height());
	$("#canvas").width($("#page_header").width()/2);
	
	
	starInit();
});

