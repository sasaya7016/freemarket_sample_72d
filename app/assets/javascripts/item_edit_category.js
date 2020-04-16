$(function(){
  $('#item_edit_category').on('change', function(){
    var parentCategory = document.getElementById('item_edit_category').value;
    if (parentCategory != "---"){
      $.ajax({
        url: 'get_category_children_edit',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove();
        $('#grandchildren_wrapper').remove();
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('通信エラー');
      })
    } else {
      $('#children_wrapper').remove();
      $('#grandchildren_wrapper').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  })
})