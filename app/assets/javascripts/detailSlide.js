$(document).on("turbolinks:load", function(){
  $('.main__item-box__item-main__content__photo__image-box__mini-image').hover(function(){
    var num = $(this).data('image-id');  //setTimeout関数内でthisが使えないので、ここで変数を指定。
    var active = $(this);                //setTimeout関数内でthisが使えないので、ここで変数を指定。
    timmer = setTimeout(function(){ //イベント発火を遅らせる
      $('.main__item-box__item-main__content__photo__header__items').animate({left: num * (-300)}, 500);
      $('.main__item-box__item-main__content__photo__image-box__mini-image').removeClass('active'); //hoverした時に「active」をクラスから消す記述。
      active.addClass('active'); //hoverした時に「active」をクラスに追加する処理。
    },1000); //1秒後に処理を実行。
  },
    function(){
    clearTimeout(timmer); //1秒経つまでにhoverが外れたらイベント発火をキャンセル。
  });
});