$(document).on("turbolinks:load", function(){

  // function buildChildHTML(child){
  //   var html =`<a class="child_category" id="${child.id}" 
  //               href="/category/${child.id}">${child.name}</a>`;
  //   return html;
  // }

  // カテゴリー検索
  $('.top-navbar-left__wrapper--list__category, .top-navbar-left__category__parent').mouseover(function() {
    $('.top-navbar-left__category__parent').show();
  });

  $('.top-navbar-left__wrapper--list__category, .top-navbar-left__category__parent').mouseleave(function(){
    $('.top-navbar-left__category__parent').hide();
  })

  function buildChildHTML(child){
    var html =`<li class="children-category-list" id="${child.id} href="/category/${child.id}">
            <h2>${child.name}</h2></li>`;
    return html;
  }

  $(".parent-category-list").on("mouseover", function() {
    var parentCategory = $(this).data("category-id"); //選択された親カテゴリのidを取得
    console.log(parentCategory);
    // $(".now-selected-red").removeClass("now-selected-red")//赤色のcssのためです
    // $('#' + parentCategory).addClass("now-selected-red");//赤色のcssのためです
    $(".children-category-list").show();
    $(".children-category-list").css('display', 'none');//一旦出ている子カテゴリ消します！
    $(".grandchildren-category-list").css('display', 'none');//孫、てめえもだ！
    $.ajax({
      url: '/tops/get_child_categories',
      type: 'GET',
      data: { parent_id: parentCategory },
      dataType: 'json'
    })
    .done(function(children){
      children.forEach(function (child) {//帰ってきた子カテゴリー（配列）
        var html = buildChildHTML(child);//HTMLにして
        $(".top-navbar-left__category__children").append(html);//リストに追加します
        console.log(html);
        // $(".children-category-list").show();
      })
    });
  });

  function buildGrandChildHTML(child){
    var html =`<a class="grand_child_category" id="${child.id}"
               href="/category/${child.id}">${child.name}</a>`;
    return html;
  }

  $(document).on("mouseover", ".child_category", function () {//子カテゴリーのリストは動的に追加されたHTMLのため
    var id = this.id
    $(".now-selected-gray").removeClass("now-selected-gray");//灰色のcssのため
    $('#' + id).addClass("now-selected-gray");//灰色のcssのため
    $.ajax({
      url: '/items/get_grandchildren_categories',
      type: 'GET',
      data: { child_id: childCategory },
      dataType: 'json'
    })
    .done(function(children) {
      children.forEach(function (child) {
        var html = buildGrandChildHTML(child);
        $(".grand_children_list").append(html);
      })
      $(document).on("mouseover", ".child_category", function () {
        $(".grand_child_category").remove();
      });
    });
  });  

  // ブランド検索
  // $('.top-navbar-left__wrapper--list__brand, .top-navbar-left__brand').mouseover(function() {
  //   $('.top-navbar-left__brand').show();
  // });

  // $('.top-navbar-left__wrapper--list__brand, .top-navbar-left__brand').mouseleave(function(){
  //   $('.top-navbar-left__brand').hide();
  // })

});