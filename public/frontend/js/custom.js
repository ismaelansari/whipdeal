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


$(document).ready(function (){
    $('.noti-btn, .n-overlay').click(function (){
        $('.notification-card').toggleClass('show-noty');
    })
})