$(document).on("turbolinks:load", function(){
  // 「着払い」時に利用する「配送の方法」フォームを作成
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
    var deliveryBurden = $('#delivery-fee').val(); //「送料込み」、「着払い」のいずれであるかを取得
    if (deliveryBurden == "postage_included") { //「送料込み」が選択された場合の処理を記述
      $('#add-delivery-method').remove();
      $(".default-delivery-method").css('display', 'block');
    } else if (deliveryBurden == "cash_on_delivery") { //「着払い」が選択された場合の処理を記述
      $(".default-delivery-method").css('display', 'none');
      appendDeliveryMethodBuyer();
    } else { //「配送料の負担」が初期値になった時、「配送の方法」フォームを削除する
      $(".default-delivery-method").css('display', 'none');
      $('#add-delivery-method').remove(); 
    }
  });
});
