$(document).on("turbolinks:load", function(){
    $('.main__item-box__item-main__content__photo__image-box__mini-image').hover(function(){
      var num = $(this).data('image-id')
      $('.main__item-box__item-main__content__photo__header__items').animate({left: num * (-300)}, 500)
      $('.main__item-box__item-main__content__photo__image-box__mini-image').removeClass("active"); //hoverした時に「active」をクラスから消す記述。
      $(this).addClass('active') //hoverした時に「active」をクラスに追加する処理。
    });
})