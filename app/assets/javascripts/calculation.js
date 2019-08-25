$(document).on("turbolinks:load", function(){
  function feeCalculation(inputPrice){
    var saleFee = Math.floor(inputPrice * 0.1); //Math.floorで小数点以下を切り捨て
    var saleProfit = inputPrice - saleFee;

    $('.sale-fee').text(`¥${saleFee}`);
    $('.selling-item__profit--result').text(`¥${saleProfit}`)
  }

  $('#selling-item-price').on('keyup', function() {
    var inputPrice = $('#selling-item-price').val();
    if ( 300 <= inputPrice && inputPrice <= 9999999) {  //価格が¥300〜¥9,999,999のときにtextを書き換え
      feeCalculation(inputPrice) 
    } else { //それ以外のときは、textを'-'に書き換え
      $('.sale-fee').text('-');
      $('.selling-item__profit--result').text('-');
    }
  });
});
