$(document).on("turbolinks:load", function(){

  $('.top-navbar-left__wrapper--list').mouseover(function() {
    $('.top-navbar-left__category-parent').show();
  });

  $('.top-navbar-left__wrapper--list').mouseleave(function(){
    $('.top-navbar-left__category-parent').hide();
  })

});