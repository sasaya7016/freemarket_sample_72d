$(function(){
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `
    <div class="listing-select-wrapper__added" id="children_wrapper">
      <div class="listing-select-wrapper__box">
        <select id="child_category" class="listing-select-wrapper__box--select" name="item[category_id]">
          <option value="---" data-category="---">---</option>
          ${insertHTML}
        </select>
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
        <select id="grandchild_category" class="listting-select-wrapper__box--select" name="item[category_id]">
          <option value="---" data-category="---">---</option>
          ${insertHTML}
        </select>
      </div>
    </div>
    `;
    $('.listing-grandchild').append(grandchildSelectHtml);
  }
  
  // サイズセレクトボックスのオプション
  function appendSizeOption(item_size){
    var html = `
    <option value="${item_size.item_size}">${item_size.item_size}</option>
    `;
    return html;
  }

  // サイズカテゴリー表示
  function appendSizeBox(insertHTML){
    var sizeSelectHtml = '';
    sizeSelectHtml = `
    <div class="listing-product-detail__size" id= 'size_wrapper'>
      <div class="listing__box--title">
        <p class="listing-default__label" for="サイズ">サイズ</p>
        <p class='listing-default--require equired'>必須</p>
      </div>
      <div class='listing-select-wrapper__added--size'>
        <div class='listing-select-wrapper__box'>
          <select class="listing-select-wrapper__box--select" id="item_size" name="item[item_size]">
            <option value="---">---</option>
            ${insertHTML}
          </select>
        </div>
      </div>
    </div>
    `;
    $('.listing-size').append(sizeSelectHtml);
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
      var childId = $('#child_category option:selected').data('category');
      if (childId != "---"){
        $.ajax({
          url: 'get_category_grandchildren',
          type: 'get',
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

  // grandchild選択後の処理
  $('.listing-grandchild').on('change', '#grandchild_category', function(){
    var grandchildId = $('#grandchild_category option:selected').data('category');
    if (grandchildId != "---"){
      $.ajax({
        url: 'get_item_size',
        type: 'get',
        data: { grandchild_id: grandchildId },
        dataType: 'json'
      })
      .done(function(item_sizes){
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
        if (item_sizes.length != 0){
          var insertHTML = '';
          item_sizes.forEach(function (item_size) {
            insertHTML += appendSizeOption(item_size);
          });
          appendSizeBox(insertHTML);
        }
      })
      .fail(function(){
        alert('通信エラー');
      })
    } else {
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });
});