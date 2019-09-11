$(document).on("turbolinks:load", function(){

  $('.top-navbar-left__wrapper--list, .top-navbar-left__category-parent').mouseover(function() {
    $('.top-navbar-left__category-parent').show();
  });

  $('.top-navbar-left__wrapper--list, .top-navbar-left__category-parent').mouseleave(function(){
    $('.top-navbar-left__category-parent').hide();
  })

});