jQuery(document).ready(function($) {

    $("#page_navigation .secondary-nav").hide();
    // $("#calendar-expand").inner
    $("#canvas").height($("#page_header").height());
    $("#canvas").width($("#page_header").width() / 2);

    $('.slider').show();
    $('.slider').slick({
        centerMode: false,
        dots: false,
        arrows: true,
        slidesToShow: 2,
        autoplay: true,
        speed: 1500,
        centerPadding: '10px',

        responsive: [
            {
              breakpoint: 1024,
              settings: {
                slidesToShow: 2,
                slidesToScroll: 2,
                arrows: false
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

    $('.event-card-slider').show();
     $('.event-card-slider').slick({
            centerMode: false,
            dots: false,
            arrows: true,
            slidesToShow: 4,
            autoplay: false,
            speed: 1500,
            centerPadding: '10px',
            responsive: [
                {
                  breakpoint: 1024,
                  settings: {
                    slidesToShow: 3,
                    slidesToScroll: 1,
                    arrows: false
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
    /*$("#right-column").stick_in_parent({
            parent: '.container',
            bottom: false

        });*/
     $('.sidebar-sticky-content').stickyMojo({footerID: '#page_footer', contentID: '#left-column'});

    var bLazy = new Blazy();

    var container = document.querySelector('#tile-grid');
    var msnry;

    imagesLoaded( container, function() {
        msnry = new Masonry( container, {
          columnWidth: 300,
          itemSelector: '.item',
          gutter: 20,
          isFitWidth: true
        })
    });

});

