$(document).on("turbolinks:load", function(){
  // 購入者が負担時の「配送の方法」フォームを作成
  function appendDeliveryMethodBuyer(){
     var deliveryMethod = ` <div id="add-delivery-method">
                              <label class="delivery-setting__burden">配送の方法
                                <span class="form-require">必須</span>
                              </label>
                              <div class="select-wrap">
                                <i class="fas fa-angle-down"></i>
                                <select class="select-wrap__input" name="item[delivery_method]" id="item_delivery_method"><option value="">---</option>
                                  <option value="undecided">未定</option>
                                  <option value="yamato">クロネコヤマト</option>
                                  <option value="post_office_pack">ゆうパック</option>
                                  <option value="post_office_mail">ゆうメール</option>
                                </select>
                              </div>
                            </div>`
    $('.select_delivery_wrapper').append(deliveryMethod);
  }

  // 「配送料の負担」選択後のイベント
  $('#delivery-fee').on('change', function(){
    var deliveryBurden = $('#delivery-fee').val(); //選択された「配送の負担」のidのvalを取得
    if (deliveryBurden == "postage_included") { //出品者負担が選択された場合の処理を記述
      $('#add-delivery-method').remove();
      $(".default-delivery-setting").css('display', 'block');
    } else if (deliveryBurden == "cash_on_delivery") { //購入者負担が選択された場合の処理を記述
      $(".default-delivery-setting").css('display', 'none');
      appendDeliveryMethodBuyer();
    } else { //「配送料の負担」が初期値になった時、「配送の方法」フォームを削除する
      $(".default-delivery-setting").css('display', 'none');
      $('#add-delivery-method').remove(); 
    }
  });
});
