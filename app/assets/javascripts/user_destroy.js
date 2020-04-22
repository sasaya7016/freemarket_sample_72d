document.addEventListener('DOMContentLoaded' , () => {

  let accountDeleteButton = document.getElementById('account-delete-button');
  let withdrawReasons = document.getElementById('withdraw-reasons');

  let modalBG = document.getElementById('modal__background');
  let modalWindowButtonBack = document.getElementById('back__button')
  accountDeleteButton.addEventListener( 'click' , deleteAlert, { passive: false } ); 

  modalWindowButtonBack.addEventListener( 'click' , modalWindowUnlock );
    function deleteAlert(e){
      if ( withdrawReasons.value.length <= 100 ){
        let options = {
            title: "退会理由を入力してください",
            text: "退会理由を100文字以上で入力してください",
            type: "warning", // warning, info, error
            showConfirmButton : true,
            confirmButtonText : '確認しました。',
            showCancelButton : true,
            cancelButtonText : '退会しない'
          }
        swal.fire(options);
      }else{
        fadeIn(modalBG , 700);
      }
    };

    function modalWindowCaution (){
      modalBG.style.display = "";
    }

    function modalWindowUnlock (){
      modalBG.style.display = 'none';
    }
    
