$(function(){
  function buildChildHTML(child){
    var html =`<a class="child_category item-link" id="${child.id}"  href="/categories/${child.id}">${child.name}</a>`;
    return html;
  }
  function buildGrandChildHTML(child){
    var html =`<a class="grandchild_category item-link" id="${child.id}"  href="/categories/${child.id}">${child.name}</a>`;
    return html;
  }
  function removeChildHTML(){
    var remove = $(".child_category").remove();
    return remove
  }
  function removeGrandChildHTML(){
    var remove = $(".grandchild_category").remove();
    return remove
  }
  $(document).on("mouseover",".category-index",function(){
    var remove = removeChildHTML()
    var remove = removeGrandChildHTML()
    })
  $(document).on("mouseover",".parent-list",function(){
    let id = this.id
    var remove = removeChildHTML()
    var remove = removeGrandChildHTML()
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
    let id = this.id
    var remove = removeGrandChildHTML()
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
        var remove = removeGrandChildHTML()
      })
    });
  });
});