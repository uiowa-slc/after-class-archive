jQuery(document).ready(function ($) {
	 $('#feedback-link').fancybox({
	 	padding: 0
	 });
	 $('.report-problem-link').fancybox({
	 	padding: 0
	 });
	 
	 $("#calendar-filter-form").hide();
	// $("#calendar-expand").inner
});
$(function() {
	$("#calendar-expand").click(function() {
	  		if($("#calendar-filter-form").css('display') == 'none'){
		  		$("#calendar-expand").addClass("active");
	  		}else{	
		  		$("#calendar-expand").removeClass("active");
	  		}
	  		$("#calendar-filter-form").toggle("slow");
	  
	});
});