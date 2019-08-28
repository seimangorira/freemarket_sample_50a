$(document).on("turbolinks:load", function(){
  // アップロードされた画像のプレビューを作成
  function appendItemList(num){
    // TODO: 画像のsrcは現在仮置き。非同期処理で受け取る？
    var itemList= ` <li class="image-lists__list">
                      <div class="item-image-wrapper__figure">
                        <img alt="イメージ1" src="/assets/mercari_icon-a5e045c514dd34e9171bdac1f50da42d19c64cba883501f8e3521a5e51b0c57b.png">
                      </div>
                      <div class="item-image-wrapper__button">
                        <a href="#">編集</a>
                        <a href="#" class="delete-uploaded-image" data-image-id="${num}">削除</a>
                      </div>
                    </li>`
    // 画像が5枚以下のときは上部のリストに、6枚以上のときは下部のリストに追加
    if (num < 6 ) {
      $('.first-image-lists').append(itemList);
    } else {
      $('.second-image-lists').append(itemList);
    }
  }

  // アップロードされた画像の枚数に応じて、ファイルフィールドの大きさを変更
  function changeDropBoxSizes(num) {
    // 計算用の数値を定義。
    num < 6 ? calNum = num : calNum = num - 5;
    
    var inputWrapper = $('.upload-images__container--now-upload')
    if (num == 0 || num == 5 ) {
      // 5枚になるときは、inputWrapperのサイズをデフォルトのサイズに戻し、プレビューの下部に表示する
      inputWrapper.width(620);
      inputWrapper.css('margin-left', '0');
    } else if (num == 10) {
      // 10枚になるときは、追加でアップロードができないよう、ファイルフィールドを隠す
      inputWrapper.css('display', 'none');
    } else {
      // プレビューされる画像の枚数に応じて、ファイルフィールドのサイズを変更
      var newWidth = 620 - (calNum * 129);
      inputWrapper.width(newWidth);
      inputWrapper.css('margin-left', '2%');
    }
  }

  // ファイルがアップロードされたときの処理
  $('.now-upload-wrapper--input').on('change', function(){
    var uploadedNum = Number($(this).attr('data-total-items')); // 現在アップロードされている画像の枚数を取得し、整数に変換
    var afterUploadNum = uploadedNum + 1  

    appendItemList(afterUploadNum);  // 画像のプレビューを作成
    changeDropBoxSizes(afterUploadNum); // ファイルボックスの大きさを変更

    $(this)[0].dataset.totalItems = afterUploadNum // カスタムデータ属性の'data-total-items'を更新(1増加させる)
  });

  // ファイルが削除されたときの処理
  // TODO: 実際にform_withで選択されたファイルを削除する処理も追記する必要あり
  $(document).on('click', '.delete-uploaded-image', function() {
    event.preventDefault(); // aタグクリックによる画面遷移を防ぐ
    $(this).parents("li").remove(); // 親要素のliを取得して削除

    var uploadedNum = Number($('.now-upload-wrapper--input').attr('data-total-items'));
    var afterDeleteNum = uploadedNum - 1
    changeDropBoxSizes(afterDeleteNum);

    // 選択されている画像が9枚になったときは、再度ファイルフィールドを表示
    if (afterDeleteNum == 9 ) {
      $('.upload-images__container--now-upload').css('display', 'inline-block');
    }
    $('.now-upload-wrapper--input')[0].dataset.totalItems -= 1; // カスタムデータ属性の'data-total-items'を更新(1減少させる) 
  })
});
