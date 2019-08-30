$(document).on("turbolinks:load", function(){
  // アップロードされた画像のプレビューを作成
  function appendItemList(num){
    var itemList= ` <li class="image-lists__list">
                      <div class="item-image-wrapper__figure">
                        <img id="preview-${num}" alt="preview-${num}">
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

  function createPreview(reader, num) {
    reader.onload = function(e){ 
      src = e.target.result;
      $(`#preview-${num}`).attr("src", src); //作成した指定のIDのimgタグにsrcを付与
    };
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
  $('.now-upload-wrapper--input').on('change', function(e){
    var files = e.target.files;
    var len = files.length;
    var uploadedNum = Number($('.now-upload-wrapper').attr('data-total-items')); // 現在アップロードされている画像の枚数を取得し、整数に変換

    for (var i = 0; i < len; i++ ) {
      var reader = new FileReader(); //FileReaderオブジェクトの生成
      var afterUploadNum = uploadedNum + i + 1

      var file = files[i]
      // アップロードされたファイルが画像でない場合は、エラー文を表示して処理を終了
      // TODO: GIFなどもアップロード可能な状態であり、複数枚同時選択時の表示に不具合があるため、今後余裕があれば他のやり方を検討する
      if (file.type.indexOf("image") < 0) {
        $('.upload-images__container--error-message').append("ファイル形式はjpeg, またはpngが使用できます");
        return false;
      } else {
        $('.upload-images__container--error-message').text(""); // エラーメッセージが既に表示されていた場合は削除
      }

      appendItemList(afterUploadNum);  // プレビュー用のHTMLを作成
      createPreview(reader, afterUploadNum); // appendItemListで作成したHTMLに対し、画像を追加
      reader.readAsDataURL(file);
    }

    changeDropBoxSizes(afterUploadNum); // ファイルボックスの大きさを変更
    $('.now-upload-wrapper')[0].dataset.totalItems = afterUploadNum; // カスタムデータ属性の'data-total-items'を更新(追加した画像の数分増加させる)
  });

  // ファイルが削除されたときの処理
  // TODO: 実際にform_withで選択されたファイルを削除する処理も追記する必要あり
  $(document).on('click', '.delete-uploaded-image', function() {
    event.preventDefault(); // aタグクリックによる画面遷移を防ぐ
    $(this).parents("li").remove(); // 親要素のliを取得して削除

    // リストの数値。削除したものより、後のリストの番号も1ずつ減らす
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
