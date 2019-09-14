$(document).on('turbolinks:load', function() {
  var form = $("#change-form");
  Payjp.setPublicKey('pk_test_9b04f8947dc68468fe3fbf43');
  
  $("#change-form").on("click", "#submit-button", function(e) {
    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true);
    var card = {
      number: parseInt($("#payment_card_no").val()),
        cvc: parseInt($("#payment_card_security_code").val()),
        exp_month: parseInt($("#payment_card_expire_mm").val()),
        exp_year: parseInt($("#payment_card_expire_yy").val())
    };
    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        alert("error")
        form.find('button').prop('disabled', false);
      }
      else {
        $(".number").removeAttr("name");
        $(".cvc").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name");

        var token = response.id;
        $("#change-form").append($('<input type="hidden" name="payjpToken" class="payjp-token" />').val(token));
        $("#change-form").get(0).submit();
      }
    });
  });
});