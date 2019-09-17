$(document).on("turbolinks:load", function(){
  $('.main__item-box__item-main__content__photo__image-box__mini-image').hover(function(){
    var num = $(this).data('image-id');
    var active = $(this);
    timmer = setTimeout(function(){
      $('.main__item-box__item-main__content__photo__header__items').animate({left: num * (-300)}, 500);
      $('.main__item-box__item-main__content__photo__image-box__mini-image').removeClass('active'); 
      active.addClass('active');
    },1000);
  },
    function(){
    clearTimeout(timmer);
  });
});