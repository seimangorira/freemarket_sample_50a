$(document).on("turbolinks:load", function(){

  // カテゴリー検索
  $('.top-navbar-left__wrapper--list__category, .top-navbar-left__category__parent').mouseover(function() {
    $('.top-navbar-left__category__parent').show();
    $('.parent-category-list').mouseover(function(){
      var parentCategory = $(this).data("category-id"); //選択された親カテゴリのidを取得
      console.log(parentCategory);
      if (parentCategory != ""){ //親カテゴリが初期値（null）でないことを確認
        $.ajax({
          url: '/items/get_children_categories',
          type: 'GET',
          data: { parent_id: parentCategory },
          dataType: 'json'
        })
        .done(function(children){
          $('.parent-category-list').change(); //親が変更された時、子以下を削除する
          $('.parent-category-list').change();
          $('.top-navbar-left__category__children').css('display', 'block');
          $('.top-navbar-left__category__children').css('display', 'none');
          children.forEach(function(children){
            ('.top-navbar-left__category__children');
          });
          ('.top-navbar-left__category__garndchildren');
        })
      }
    })
  });

  $('.top-navbar-left__wrapper--list__category, .top-navbar-left__category__parent').mouseleave(function(){
    $('.top-navbar-left__category__parent').hide();
  })

  // ブランド検索
  $('.top-navbar-left__wrapper--list__brand, .top-navbar-left__brand').mouseover(function() {
    $('.top-navbar-left__brand').show();
  });

  $('.top-navbar-left__wrapper--list__brand, .top-navbar-left__brand').mouseleave(function(){
    $('.top-navbar-left__brand').hide();
  })

});