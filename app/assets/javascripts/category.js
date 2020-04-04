$(function(){
  // カテゴリーセレクトボックスのオプション表示
  function appendOption(category){
    var html = `
    <option value="${category.name}" data-category="${category.id}">${category.name}</option>
    `;
    return html;
  }
  // 子カテゴリーの表示
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `
    <div class="listing-select-wrapper__added" id="children_wrapper">
      <div class="listing-select-wrapper__box">
        <select id="child_category" class="listing-select-wrapper__box--select">
          <option value="---" data-category="---">---</option>
          ${insertHTML}
        </select>
        <i class="fas fa-chevron-down listing-select-wrapper__box--arrow-down"></i>
      </div>
    </div>
    `;
    $('.listing-child').append(childSelectHtml);
  }
  // 孫カテゴリー表示
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml =`
    <div class="listing-select-wrapper__added" id="grandchildren_wrapper">
      <div class="listing-select-wrapper__box">
        <select name="category_id" id="grandchild_category" className="listting-select-wrapper__box--select">
          <option value="---" data-category="---">---</option>
          ${insertHTML}
        </select>
      </div>
    </div>
    `;
    $('.listing-grandchild').append(grandchildSelectHtml);
  }

  // parentカテゴリー選択後の処理
  $('#parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value; 
    if (parentCategory != "---"){
      $.ajax({
        url: 'get_category_children',
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
  });
    
  // childカテゴリー選択後の処理
    $('.listing-child').on('change','#child_category', function(){
      console.log('ok')
      var childId = $('#child_category option:selected').data('category');
      if (childId != "---"){
        $.ajax({
          url: 'get_category_grandchildren',
          type: 'GET',
          data: { child_id: childId },
          dataType: 'json'
        })
        .done(function(grandchildren){
          if (grandchildren.length != 0) {
            $('#grandchildren_wrapper').remove();
            $('#size_wrapper').remove();
            $('#brand_wrapper').remove();
            var insertHTML = '';
            grandchildren.forEach(function(grandchild){
              insertHTML += appendOption(grandchild);
            });
            appendGrandchidrenBox(insertHTML);
          }
        })
        .fail (function(){
          alert('通信エラー')
        })
      } else {
        $('#grandchildren_wrapper').remove();
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
      }
  });
});