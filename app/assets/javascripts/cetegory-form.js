$(document).on("turbolinks:load", function(){

  // カテゴリー検索
  $('.top-navbar-left__wrapper--list__category, .top-navbar-left__category-parent').mouseover(function() {
    $('.top-navbar-left__category-parent').show();
  });

  $('.top-navbar-left__wrapper--list__category, .top-navbar-left__category-parent').mouseleave(function(){
    $('.top-navbar-left__category-parent').hide();
  })

  // ブランド検索
  $('.top-navbar-left__wrapper--list__brand, .top-navbar-left__brand').mouseover(function() {
    $('.top-navbar-left__brand').show();
  });

  $('.top-navbar-left__wrapper--list__brand, .top-navbar-left__brand').mouseleave(function(){
    $('.top-navbar-left__brand').hide();
  })

});