//下記if構文は"users/:id/show"のみにJSを適用させるためのもの。
//下記if構文は"users/:id/"のみにJSを適用させるためのもの。
if (document.location.href.match(/\/users\/\d+/)) {
  //UserMyPageのタブ機能
  window.addEventListener('DOMContentLoaded', () => {
  document.addEventListener('DOMContentLoaded', () => {
    let mypageTabHeadSell = document.getElementById("mypage-tab__list-new");
    let mypageTabHeadSold = document.getElementById("mypage-tab__list-old");
    //Tab部分のactiveと非activeの操作
    mypageTabHeadSell.addEventListener('click',() => {
      tabAction();
    });
    mypageTabHeadSold.addEventListener('click',() => {
      tabAction();
    });
    function tabAction () {
      let activeTab = document.getElementById("tab__content-new");
      let inactiveTab = document.getElementById("tab__content-old");
      mypageTabHeadSell.parentNode.classList.toggle("tab-active");
      mypageTabHeadSold.parentNode.classList.toggle("tab-active");
      activeTab.classList.toggle("display--none");
      inactiveTab.classList.toggle("display--none");
    };
  });
    });
  }