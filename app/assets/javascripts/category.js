$(document).on("turbolinks:load", function(){
  // カテゴリセレクトボックスのオプションを作成
  function appendOption(category){
    var option = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return option;
  }
  
  // 子カテゴリの表示作成
  function appendChidrenBox(insertHTML){
    var childSelectBox = `<div class="select-wrap" id="children_wrapper">
                                <i class="fas fa-angle-down"></i>
                                <select class="select-wrap__input" id="child_category" name="">
                                  <option value="" data-category="---">---</option>
                                  ${insertHTML}
                                </select>
                             </div>`;
    $('.select-categories-wrapper').append(childSelectBox);
  }

  // 孫カテゴリの作成
  function appendGrandChidrenBox(insertHTML){
    var grandChildSelectBox = `<div class="select-wrap" id="grandchildren_wrapper">
                                <i class="fas fa-angle-down"></i>
                                <select class="select-wrap__input" id="grandchild_category" name="item[category_id">
                                  <option value="---" data-category="---">---</option>
                                  ${insertHTML}
                                </select>
                             </div>`;
    $('.select-categories-wrapper').append(grandChildSelectBox);
  }

  // 親カテゴリ選択後のイベント
  $('#parent_category').on('change', function(){
    var parentCategory = $('#parent_category').val(); //選択された親カテゴリのidを取得
    if (parentCategory != ""){ //親カテゴリが初期値（null）でないことを確認
      $.ajax({
        url: '/items/get_children_categories',
        type: 'GET',
        data: { parent_id: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove(); //親が変更された時、子以下を削除する
        $('#grandchildren_wrapper').remove();
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリ取得に失敗しました');
      })
    } else{
      $('#children_wrapper').remove(); //親カテゴリが初期値になった時、子以下を削除する
      $('#grandchildren_wrapper').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });

  // 小カテゴリ選択後のイベント
  $(document).on('change', '#child_category', function(){
    var childCategory = $('#child_category').val(); //選択された子カテゴリのidを取得
    if (childCategory != ""){ //子カテゴリが初期値（null）でないことを確認
      $.ajax({
        url: '/items/get_grandchildren_categories',
        type: 'GET',
        data: { child_id: childCategory },
        dataType: 'json'
      })
      .done(function(grandchildren){
        $('#grandchildren_wrapper').remove();  //子が変更された時、孫以下を削除する
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
        var insertHTML = '';
        grandchildren.forEach(function(grandchild){
          insertHTML += appendOption(grandchild);
        });
        appendGrandChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリ取得に失敗しました');
      })
    } else{
      $('#grandchildren_wrapper').remove();  //子カテゴリが初期値になった時、孫以下を削除する
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });
});
