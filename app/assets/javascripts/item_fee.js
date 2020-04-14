$(function(){
  $('#item_price').change(function(){
    // 入力された値を変数に代入し、integer型にする
    let input = $('#item_price').val()
    let price = parseInt(input)
    // 小数点を切り捨て、手数料込みの金額を計算
    let commission = Math.floor(price * 0.1)
    // 小数点を切り捨て、利益を計算
    let benefit = Math.floor(price - (price * 0.1))
    // 値段をHTMLに代入・空のときのNaN値を処理
    if (isNaN(commission) && isNaN(benefit)){
      document.getElementById('inner-commission').innerHTML =  "0円";
      document.getElementById('inner-benefit').innerHTML = "0円";
    }else{
      document.getElementById('inner-commission').innerHTML = commission + "円";
      document.getElementById('inner-benefit').innerHTML = benefit + "円";
    }
  });
});