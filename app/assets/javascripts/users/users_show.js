
let mypageTabNewSells = document.getElementById("mypage-tab__list-new");
mypageTabNewSells.addEventListener('click',()=>{
  let activeTab = document.getElementById("tab__content-new");
  let inactiveTab = document.getElementById("tab__content-old");
  mypageTabNewSells.parentNode.classList.add("active-tab");
  inactiveTab.classList.add("display--none")

});