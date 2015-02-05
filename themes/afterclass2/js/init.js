$(document).foundation({
  dropdown: {
    // specify the class used for active dropdowns
    active_class: 'open'
  }
});
jQuery(document).ready(function($) {

    var bLazy = new Blazy();

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
        onAfterChange: function(){
          // do funky JS stuff here
          bLazy.revalidate();
        },

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
                arrows: false
              }
            }
          ]

    });

    $('.event-card-slider').show();
    $('.event-card-slider').slick({
            centerMode: false,
            dots: false,
            arrows: false,
            slidesToShow: 4,
            slidesToScroll: 4,
            autoplay: false,
            speed: 500,
            centerPadding: '10px',
            responsive: [
                {
                  breakpoint: 1024,
                  settings: {
                    slidesToShow: 3,
                    slidesToScroll: 3,
                    arrows: false
                  }
                },
                {
                  breakpoint: 768,
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
                    arrows: false
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

   



/*
    var container = document.querySelector('#tile-grid');
    var msnry;

    imagesLoaded( container, function() {
        msnry = new Masonry( container, {
          columnWidth: 300,
          itemSelector: '.item',
          gutter: 20,
          isFitWidth: true
        })
    });*/

});

