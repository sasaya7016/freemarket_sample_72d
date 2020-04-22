document.addEventListener('DOMContentLoaded' , () => {

  let accountDeleteButton = document.getElementById('account-delete-button');
  let withdrawReasons = document.getElementById('withdraw-reasons');

  let modalBG = document.getElementById('modal__background');
  let modalWindowButtonBack = document.getElementById('back__button')
  accountDeleteButton.addEventListener( 'click' , deleteAlert, { passive: false } ); 
  modalWindowButtonBack.addEventListener( 'click' , modalWindowUnlock );
