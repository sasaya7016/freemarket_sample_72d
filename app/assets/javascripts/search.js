//並び替え機能
$(document).on('change', '#q_sorts', function () {
  $('#search_submit').trigger('click');
});


//詳細検索価格入力
$(document).on('change', '#price_select', function () {
  var value = $(this).val();
  if(value == 1){
    $('#q_price_gteq').val(300);
    $('#q_price_lteq').val(1000);
  }
  else if(value == 2){
    $('#q_price_gteq').val(1000);
    $('#q_price_lteq').val(5000);
  }
  else if(value == 3){    
    $('#q_price_gteq').val(5000);
    $('#q_price_lteq').val(10000);
  }
  else if(value == 4){    
    $('#q_price_gteq').val(10000);
    $('#q_price_lteq').val(30000);
  }
  else if(value == 5){
    $('#q_price_gteq').val(30000);
    $('#q_price_lteq').val(50000);
  }
  else if(value == 6){
    $('#q_price_gteq').val(50000);
    $('#q_price_lteq').val("");
  }
  else {
    $('#q_price_gteq').val("");
    $('#q_price_lteq').val("");
  }
});


// クリアボタンを押した時にフォームをリセット
$('#search-clear').click(function(e){
  $('.search__sidebar__box').find('#q_name_cont').val("");
  $('.search__sidebar__box').find('input').val("");
  // $('.middle-category').css('display','none');
  // $('.small-category').css('display','none');
  $('#search_submit').val("完了");
  e.preventDefault();
  return false;
});