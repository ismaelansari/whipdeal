$(document).ready(function () {
    /********/
    $('.submenu-wrapper > a').click(function () {
        $(this).parent().toggleClass('submenuToggle');
    });
});

$(document).ready(function () {
    /*$(window).scroll(function(){
        if ($(window).scrollTop() >= 45) {
            $('body').addClass('fixed-header');
        }
        else {
            $('body').removeClass('fixed-header');
        }
    });*/

    /****/
    $(".toggle-menu").click(function () {
        $('header nav').slideToggle('open');
        $('body').toggleClass('navbar-toggle');
    });

    /**slick-slider**/
    $('.slick-slider').slick({
        dots: false,
        autoplay: true,
        autoplaySpeed: 3000,
        infinite: true,
        speed: 500,
        fade: true,
        cssEase: 'linear'
    });

    /**slick-slider**/
    $('.portfolio-slider .carousel').slick({
        arrows: true,
        centerPadding: '7px',
        slidesToShow: 4,
        speed: 200,
        infinite: true,
        adaptiveHeight: true,
        autoplay: true,
        autoplaySpeed: 1500,
        responsive: [
            {
                breakpoint: 768,
                settings: {
                    arrows: false,
                    centerMode: true,
                    centerPadding: '7px',
                    slidesToShow: 3
                }
            },
            {
                breakpoint: 576,
                settings: {
                    arrows: false,
                    centerMode: true,
                    centerPadding: '7px',
                    slidesToShow: 2
                }
            },
            {
                breakpoint: 476,
                settings: {
                    arrows: false,
                    centerMode: true,
                    centerPadding: '40px',
                    slidesToShow: 1
                }
            }
        ]
    });

    $(".get-started a").click(function () {
        $('html,body').animate({
            scrollTop: $('.' + $(this).attr('data-target') + '').offset().top - 120
        }, 'slow');
    });

    $("header a").click(function () {
        $('html,body').animate({
            scrollTop: $('.' + $(this).attr('data-target') + '').offset().top - 120
        }, 'slow');
    });
});

