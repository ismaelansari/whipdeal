$(document).ready(function(){
      $('.toggle-btn, .close-menu, .Navoverlay').click(function() {
      // $('body').addClass('toggle-class');
      $("body").toggleClass("toggle-class");
    });
    
    /**custom-dropdown**/
    $('.custom-dropdown .dropdown-btn').click(function(){
        $(this).parent().toggleClass('show-c-dropdown');
    });
    $('.custom-dropdown .cfb-overlay').click(function(){
        $('.custom-dropdown').removeClass('show-c-dropdown');
    });
});
/**************/
/**loader javascript**/

    var preloader = $('#loader-wrapper');
    var myVar;

    function aakashloader(){
        preloader.css("transition", "all 0.5s");
        preloader.css("visibility", "hidden");
        preloader.css("opacity", "0");
        window.scrollTo(0, 0);
    };

    function loaderfun() {
        myVar = setTimeout(aakashloader, 800);
    }

/****end****/

$(document).ready(function (){
    $('.noti-btn, .n-overlay').click(function (){
        $('.notification-card').toggleClass('show-noty');
    })
})