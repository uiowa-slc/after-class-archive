$(document).foundation({
  dropdown: {
    // specify the class used for active dropdowns
    active_class: 'open'
  }
});


jQuery(document).ready(function($) {

    var bLazy = new Blazy();
    bLazy.revalidate();
    //$("#page_navigation .secondary-nav").hide();
    // $("#calendar-expand").inner
    $("#canvas").height($("#page_header").height());
    $("#canvas").width($("#page_header").width() / 2);



    $('.slider').show();

var flky = new Flickity( '.slider', {
  // options, defaults listed

  accessibility: true,
  // enable keyboard navigation, pressing left & right keys

  autoPlay: false,
  // advances to the next cell
  // if true, default is 3 seconds
  // or set time between advances in milliseconds
  // i.e. `autoPlay: 1000` will advance every 1 second

  cellAlign: 'center',
  // alignment of cells, 'center', 'left', or 'right'
  // or a decimal 0-1, 0 is beginning (left) of container, 1 is end (right)

  cellSelector: undefined,
  // specify selector for cell elements

  contain: false,
  // will contain cells to container
  // so no excess scroll at beginning or end
  // has no effect if wrapAround is enabled

  draggable: true,
  // enables dragging & flicking

  freeScroll: false,
  // enables content to be freely scrolled and flicked
  // without aligning cells

  friction: 0.2,
  // smaller number = easier to flick farther

  initialIndex: 0,
  // zero-based index of the initial selected cell

  lazyLoad: true,
  // enable lazy-loading images
  // set img data-flickity-lazyload="src.jpg"
  // set to number to load images adjacent cells

  percentPosition: true,
  // sets positioning in percent values, rather than pixels
  // Enable if items have percent widths
  // Disable if items have pixel widths, like images

  prevNextButtons: true,
  // creates and enables buttons to click to previous & next cells

  pageDots: true,
  // create and enable page dots

  resize: true,
  // listens to window resize events to adjust size & positions

  rightToLeft: false,
  // enables right-to-left layout

  setGallerySize: true,
  // sets the height of gallery
  // disable if gallery already has height set with CSS

  watchCSS: false,
  // watches the content of :after of the element
  // activates if #element:after { content: 'flickity' }
  // IE8 and Android 2.3 do not support watching :after
  // set watch: 'fallbackOn' to enable for these browsers

  wrapAround: false
  // at end of cells, wraps-around to first for infinite scrolling

});

    /*$('.slider').slick({
        centerMode: false,
        dots: false,
        arrows: true,
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
                arrows: false
              }
            },
            {
              breakpoint: 768,
              settings: {
                slidesToShow: 1,
                slidesToScroll: 1,
                arrows: false
              }
            }
          ]

    });*/
    bLazy.revalidate();

  /*  $('.slider').on('beforeChange', function(event, slick, currentSlide, nextSlide){
      bLazy.revalidate();
    });

    $('.event-card-slider').show();
    $('.event-card-slider').slick({
            infinite: true,
            centerMode: false,
            dots: false,
            arrows: true,
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
                    arrows: true
                  }
                },
                {
                  breakpoint: 768,
                  settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2,
                    arrows: true
                  }
                },
                {
                  breakpoint: 480,
                  settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    arrows: true
                  }
                }
              ]

        });
*/
    $("#calendar-expand").click(function() {
        if ($(".secondary-nav").css('display') == 'none') {
            $("#calendar-expand").addClass("active");
        } else {
            $("#calendar-expand").removeClass("active");
        }
        $(".secondary-nav").toggle();
        return false;
    });

});

