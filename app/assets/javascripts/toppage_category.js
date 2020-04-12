$(function(){
  function buildChildHTML(child){
    var html =`
    <a class="child_category item-link" id="${child.id}"  href="/categories/${child.id}">${child.name}</a>
    `;
    return html;
  }

  function buildGrandChildHTML(child){
    var html =`
    <a class="grandchild_category item-link" id="${child.id}"  href="/categories/${child.id}">${child.name}</a>
    `;
    return html;
  }
  
    $(document).on("mouseover",".category-index",function(){
      $(".child_category").remove();
      $(".grandchild_category").remove();
    })

  $(document).on("mouseover",".parent-list",function(){
    var id = this.id
    $(".child_category").remove();
    $(".grandchild_category").remove();
    $.ajax({
      type: 'get',
      url: '/categories/get_toppage_category',
      data: {parent_id: id},
      dataType: 'json'
    })
    .done(function(children){
      children.forEach(function (child){
        var html = buildChildHTML(child);
        $(".children_list").append(html);
      })
    });
  });
  
  $(document).on("mouseover",".child_category",function(){
    var id = this.id
    $(".grandchild_category").remove();
    $.ajax({
      type: 'get',
      url: '/categories/get_toppage_category',
      data: {parent_id: id},
      dataType: 'json'
    })
    .done(function(children){
      children.forEach(function (child){
        var html = buildGrandChildHTML(child);
        $(".grandchildren_list").append(html);
      })
      $(document).on("mouseover","child_category",function(){
        $(".grandchild_category").remove();
      })
    });
  });
});