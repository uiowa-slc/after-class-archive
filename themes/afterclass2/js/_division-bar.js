$(window).load(function() {	


    $('.search-toggle').click(function() {
        $(this).toggleClass('active');
      
        return false;
    });

	$('.directory-toggle').click(function() {
		$(this).toggleClass("active");
		
		return false;
	});

    $('.division-menu').bind('click', '.has-subnav a', function() {
        $(".division-show-hide").slideToggle();
        

    });

});