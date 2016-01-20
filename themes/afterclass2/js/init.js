jQuery(document).ready(function($) {

    $("#page_navigation .secondary-nav").hide();
    // $("#calendar-expand").inner
    $("#canvas").height($("#page_header").height());
    $("#canvas").width($("#page_header").width() / 2);
    $('.slider').slick({
        dots: true,
        arrows: false
    });

    $("#calendar-expand").click(function() {
        if ($(".secondary-nav").css('display') == 'none') {
            $("#calendar-expand").addClass("active");
        } else {
            $("#calendar-expand").removeClass("active");
        }
        $(".secondary-nav").toggle();
        return false;
    });

     $('.sidebar-sticky-content').stickyMojo({footerID: '#page_footer', contentID: '#left-column'});

     var bLazy = new Blazy();

     $("#page_content").fitVids();

});

