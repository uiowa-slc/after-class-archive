

if ( $("#truncontent").css("z-index") == 4){
	$("#truncswitch").css("display", "block");
	var graphs = $('#truncontent').children('p');
	graphs.each(function(index) {
		if (index > 1) {
			$(this).hide();
		}		
	});
	
	var show = 0
		
	$("#truncswitch").click(function() {	
		if (show == 0) {
			graphs.each(function() {
				$(this).show();	
			});
			$("#truncswitch").html("Read less -");
			show = 1;
		} else {
			graphs.each(function(index) {
				if (index > 1) {
					$(this).hide();
				}		
			});	
			$("#truncswitch").html("Read More +");
			show = 0;
		}
	});	
}

