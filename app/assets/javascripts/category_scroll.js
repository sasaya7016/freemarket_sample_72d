$(function(){
  $('a[class="parent-btn"]').click(function(){
    target = document.getElementById(this.hash);
    target.scrollIntoView({
      behavior: 'smooth'
    });
    return false;
  });
});