$(document).on("turbolinks:load", function(){
    $('.main__item-box__item-main__content__photo__image-box__mini-image').hover(function(){
      var num = $(this).data('image-id')
      $('.main__item-box__item-main__content__photo__header__items').animate({left: num * (-300)}, 500)
    });
})