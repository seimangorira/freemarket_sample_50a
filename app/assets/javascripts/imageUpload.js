$(document).on("turbolinks:load", function(){
  // アップロードされた画像のプレビューを作成
  function appendItemList(num){
    // 画像のsrcは現在仮置き。非同期処理で受け取る？
    var itemList= ` <li class="image-lists__list">
                      <div class="item-image-wrapper__figure">
                        <img alt="イメージ1" src="/assets/mercari_icon-a5e045c514dd34e9171bdac1f50da42d19c64cba883501f8e3521a5e51b0c57b.png">
                      </div>
                      <div class="item-image-wrapper__button">
                        <a href="#">編集</a>
                        <a href="#">削除</a>
                      </div>
                    </li>`
    // 画像が5枚以下のときは上部のリストに、5枚以上のときは下部のリストに追加
    if (num < 5 ) {
      $('.first-image-lists').append(itemList);
    } else {
      $('.second-image-lists').append(itemList);
    }
  }

  // アップロードされた画像の枚数に応じて、ファイルフィールドの大きさを変更
  function changeDropBoxSizes(num) {
    // 計算用の数値を定義。
    num < 5 ? calNum = num + 1 : calNum = num - 4;
    
    var inputWrapper = $('.upload-images__container--now-upload')
    if (num == 4 ) {
      // 既に4枚存在するときは、inputWrapperのサイズをデフォルトのサイズに戻し、プレビューの下部に表示する
      inputWrapper.width(620);
      inputWrapper.css('margin-left', '0');
    } else if (num == 9) {
      // 既に9枚存在するときは、追加でアップロードができないよう、ファイルフィールドを隠す
      inputWrapper.css('display', 'none');
    } else {
      // プレビューされる画像の枚数に応じて、ファイルフィールドのサイズを変更
      var newWidth = 620 - (calNum * 129);
      inputWrapper.width(newWidth);
      inputWrapper.css('margin-left', '2%');
    }

    // カスタムデータ属性の'data-total-items'を更新(1増加させる)
    var newNumId = num + 1
    $('.now-upload-wrapper--input')[0].dataset.totalItems = newNumId
  }

  // ファイルがアップロードされたときの処理
  $('.now-upload-wrapper--input').on('change', function(){
    var uploadedNum = Number($(this).attr('data-total-items')); // 現在アップロードされている画像の枚数を取得し、整数に変換
    appendItemList(uploadedNum);  // 画像のプレビューを作成
    changeDropBoxSizes(uploadedNum) // ファイルボックスの大きさを変更
  });
});
