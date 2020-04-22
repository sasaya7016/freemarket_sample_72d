document.addEventListener(
  "DOMContentLoaded", e => {
    if (document.getElementById("token_submit") != null) {
      Payjp.setPublicKey("pk_test_002e2eb061c6ee34a67757fc");
      let btn = document.getElementById("token_submit");
      btn.addEventListener("click", e => {
        e.preventDefault();
        let card = {
          number: document.getElementById("card_number").value,
          cvc: document.getElementById("cvc").value,
          exp_month: document.getElementById("exp_month").value,
          exp_year: document.getElementById("exp_year").value
        };
        Payjp.createToken(card, (status, response) => {
          if (status === 200) {
            $("#card_number").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name");
            $("#card_token").append($('<input type="hidden" name="payjp-token">').val(response.id));
            document.inputForm.submit();
            let options = {
              title: "カードの登録が完了しました",
              type: "info",  // warning, info, error
              showConfirmButton : true,
              confirmButtonText : '確認しました。'
            }
            swal.fire(options);
          } else {
            let options = {
              title: "カード情報が正しくありません。",
              text: "正しいカード情報を入力してください",
              type: "warning", // warning, info, error
              showConfirmButton : true,
              confirmButtonText : '確認しました。',
              showCancelButton : true,
              cancelButtonText : '登録をやめる'
              }
          swal.fire(options);
          }
        });
      });
    }
  },
  false
);

