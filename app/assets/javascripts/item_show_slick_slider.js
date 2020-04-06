$(function () {
  $('.slick').slick({
    asNavFor: '.thumbnail',
    arrows: false,
    slidesToShow: 1,

  });
  $('.thumbnail').slick({
    asNavFor: '.slick',
    focusOnSelect: true,
    arrows: false,
    slidesToShow: 4,
  });
});
