$(document).on("turbolinks:load", function(){

  // 便利そうやけど、使い方がわからない
  // function appendOption(category){
  //   var option = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
  //   return option;
  // }

  function appendParentCategory(){
    var html = `<ul class="category-nav-parent-wrap" style="width: auto;">
    <li class="category-nav-parent">
      <h3>レディース</h3>
    </li>
    <li class="category-nav-parent">
      <h3>メンズ</h3>
    </li>
  </ul>`
    return html;
  }

  // $('a.category-search-form').mouseover(function() {
  $('a.category-search-form').mouseover(function() {
    // console.log("OK");
    appendParentCategory;
  });

  $('a.category-search-form').mouseleave(function(){
    // console.log("わーい");
  })

});