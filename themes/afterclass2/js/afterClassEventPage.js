if ( $("#truncontent").css("z-index") == 4){
	$("#truncontent > p").each(function (index) {
		if (index > 0) {
			$(this).hide();
		}
	});
	$("#truncswitch").css("display", "block");
	$("#truncswitch").on("click", function() {
		//if (flipper % 2 == 0) {
		$("#truncontent > p").each(function (index) {
			$(this).show();
		});
		$("#truncswitch").hide();
	});	
	
	$(window).resize(function() {
		if ( $("#truncontent").css("z-index") < 4){
			$("#truncontent > p").each(function (index) {
				if (index > 0) {
				$(this).show();
				}
			});
			$("#truncswitch").hide();
		} else if ($("#truncontent").css("z-index") == 4) {
			$("#truncontent > p").each(function (index) {
				if (index > 0) {
				$(this).hide();
				}
			});
			$("#truncswitch").show();
		}
	});	
}