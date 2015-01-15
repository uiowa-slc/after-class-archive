jQuery(document).ready(function($) {

    $("#page_navigation .secondary-nav").hide();
    // $("#calendar-expand").inner
    $("#canvas").height($("#page_header").height());
    $("#canvas").width($("#page_header").width() / 2);
    $('.slider').show();

    $('.slider').slick({
        centerMode: false,
        dots: false,
        arrows: false,
        slidesToShow: 3,
        autoplay: true,
        speed: 1500,
        centerPadding: '10px',

        responsive: [
            {
              breakpoint: 1024,
              settings: {
                slidesToShow: 2,
                slidesToScroll: 2,
              }
            },
            {
              breakpoint: 480,
              settings: {
                slidesToShow: 1,
                slidesToScroll: 1,
                dots: false
              }
            }
          ]

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

    // $('.sidebar-sticky-content').stickyMojo({footerID: '#page_footer', contentID: '#left-column'});

     var bLazy = new Blazy();

});

