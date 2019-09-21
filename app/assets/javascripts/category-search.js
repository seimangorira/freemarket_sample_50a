$(document).on("turbolinks:load", function(){

  // カテゴリー検索
  $('.category-select, children-category-list, grandchildren-category-list').mouseover(function() {
    $('.top-navbar-left__category__parent').show();
  });

  $('.category-select, children-category-list, grandchildren-category-list').mouseleave(function(){
    $('.top-navbar-left__category__parent').hide();
    $(".top-navbar-left__category__kodomotachi").hide();
  });

  // 追加される子カテゴリーのHTML
  function buildChildHTML(child){
    var html =`<li class="children-category-list" id="${child.id}" data-child-id="${child.id}" href="/category/${child.id}"><h2>${child.name}</h2></li>`;
    return html;
  }

  $(".parent-category-list").on("mouseover", function() {// 親カテゴリーリストにマウスをのせると…
    $(".children-category-list").show();// 子カテゴリーが出てきます
    $(".children-category-list").remove();// 選択した親カテゴリーが変更されると、一旦消えます
    $(".grandchildren-category-list").remove();
    var parentCategory = $(this).data("category-id");
    $.ajax({
      url: '/tops/get_child_categories',
      type: 'GET',
      data: { parent_id: parentCategory },
      dataType: 'json'
    })
    .done(function(children){
      $(".top-navbar-left__category__kodomotachi").show();//親の値を取ってきて、子カテゴリー登場
      children.forEach(function (child) {
        var html = buildChildHTML(child);
        $(".top-navbar-left__category__kodomotachi__children").append(html);
      })
    });
  });

  // 追加される孫カテゴリーのHTML
  function buildGrandChildHTML(grandchild){
    var html =`<li class="grandchildren-category-list" id="${grandchild.id}" href="/category/${grandchild.id}"><h2>${grandchild.name}</h2></li>`;
    return html;
  }

  $(document).on("mouseover", ".children-category-list", function () {
    $(".grandchildren-category-list").remove();//changeすると入れ替わる
    var childCategory = $(this).data("child-id");
    $.ajax({
      url: '/tops/get_grandchild_categories',
      type: 'GET',
      data: { child_id: childCategory },
      dataType: 'json'
    })
    .done(function(children) {
      $(".top-navbar-left__category__kodomotachi__grandchildren").css('display', 'block');
      children.forEach(function (grandchild) {
        var html = buildGrandChildHTML(grandchild);
        $(".top-navbar-left__category__kodomotachi__grandchildren").append(html);
      })
    })
  });  

  // ブランド検索
  $('.top-navbar-left__wrapper--list__brand, .top-navbar-left__brand').mouseover(function() {
    $('.top-navbar-left__brand').show();
  });

  $('.top-navbar-left__wrapper--list__brand, .top-navbar-left__brand').mouseleave(function(){
    $('.top-navbar-left__brand').hide();
  })

});