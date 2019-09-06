$(document).on("turbolinks:load", function(){
  // ページ読み込み時に、商品出品フォームのサイズを決定
    var initialNum = Number($('.now-upload-wrapper').attr('data-total-items'));
    changeDropBoxSizes(initialNum);
  
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
  
  // ページ読み込み時にremove-check-boxのチェックを外す（update失敗後の対応）
  $('.remove-check-box').prop('checked', false);

  // 保存済みファイルを削除する際の処理
  $(document).off('click', '.delete-saved-image');
  $(document).on('click', '.delete-saved-image', function() {
    event.preventDefault(); // aタグクリックによる画面遷移を防ぐ

    var imageId = $(this).data('saved-image-id');
    $(this).parents("li").css('display', 'none'); // 親要素のliを取得して削除

    // 選択された画像のIDを取得し、paramsをControllerで受け取れるようにする
    $(`.remove-item-image-${imageId}`).prev($("input")).val(`${imageId}`) // デフォルト値の0を変更する
    $(`.remove-item-image-${imageId}`).prop('checked', true);

    var uploadedNum = Number($('.now-upload-wrapper').attr('data-total-items'));
    var afterDeleteNum = uploadedNum - 1
    changeDropBoxSizes(afterDeleteNum);

    // 選択されている画像が9枚になったときは、再度ファイルフィールドを表示
    if (afterDeleteNum == 9 ) {
      $('.upload-images__container--now-upload').css('display', 'inline-block');
    }
    $('.now-upload-wrapper')[0].dataset.totalItems -= 1; // カスタムデータ属性の'data-total-items'を更新(1減少させる) 
  })
});

