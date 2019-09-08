$(document).on("turbolinks:load", function() {
  Payjp.setPublikKey("pk_test_9b04f8947dc68468fe3fbf43");
  var form = $("#change-form");
  var number    = document.querySelector('input[name="number"]'),
      cvc       = document.querySelector('input[name="cvc"]'),
      exp_month = document.querySelector('input[name="exp_month]'),
      exp_year  = document.querySelector('input[name="exp_yaer"]');

  document.querySelector(".submit").addEventListener("click", function(e) {
    e.preventDefault();
    var card = {
      number: number.value,
      cvc: cvc.value,
      exp_month: exp_month.value,
      exp_yaer: exp_yaer.value
    }
    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        document.getElementById("result").innerText = "Token = " + response.id;
      }
      else {
        $(".number").removeAttr("name");
        $(".cvc").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name");

        var token = response.id

        form.append($('<input type="hidden" name="payjp_token" class="payjp_token" />').val(token));
        form.get(0).submit();
      }
    });
  });
});