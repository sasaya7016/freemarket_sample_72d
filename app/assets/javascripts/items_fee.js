//このJSファイルは'items/new'と'items/:id/edit'を対象とする。
if (document.location.href.match(/\/items\/new/) || document.location.href.match(/\/items\/\d+\/edit/)){
  document.addEventListener('DOMContentLoaded',() => {
    let itemPrice = document.getElementById('item_price');
    let innerCommission = document.getElementById('inner-commission');
    let innerBenefit = document.getElementById('inner-benefit');
    document.addEventListener('change', benefitCalculation);
    //利益計算の関数
    function benefitCalculation() {
        // 入力された値を変数に代入し、integer型にする
        let input = itemPrice.value
        let price = parseInt(input)
      if (price < 10000000){
        // 小数点を切り捨て、手数料込みの金額を計算
        let commission = Math.floor(price * 0.1)
        // 小数点を切り捨て、利益を計算
        let benefit = Math.floor(price - (price * 0.1))
        // 値段をHTMLに代入・空のときのNaN値を処理
        if (isNaN(commission) && isNaN(benefit)){
          innerCommission.innerHTML =  "0円";
          innerBenefit.innerHTML = "0円";
        }else{
          innerCommission.innerHTML = commission + "円";
          innerBenefit.innerHTML = benefit + "円";
        }
      }else{
        let options = {
          title: "ERROR",
          text: "金額は¥ 9999999 円以下です。",
          icon: "info", // warning, info, error
          timer: 3000, // 3秒後に自動的にアラートを閉じる
          buttons: false,
      }
      swal(options)
      }
    };
  }); 
}