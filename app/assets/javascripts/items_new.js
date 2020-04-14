if (document.location.href.match(/\/items\/new/) || document.location.href.match(/\/items\/\d+\/edit/)){
  document.addEventListener('DOMContentLoaded',()=>{
    //preview生成
      //削除ボタン生成
    const buildImg = (index ,url ) => {
      const html = `
      <div data-index="${index}" class="exhibit__image-box__previews__preview">
        <div class="exhibit__image-box__previews__preview__image">
          <img class="image${index} input__images" data-index="${index}" src="${url}" width="120px" height="120px">
          <div class="exhibit__image-box__previews__preview__delete img-remove">
            削除
          <div>
        <div>
      <div>`;
      return html;
      }
    //imageのinputを生成
    const buildFileField = (num) => {
      const html = `
      <div data-index="${num}" class="img-file_group">
        <input class="img-file" type="file" name="item[item_images_attributes][${num}][image]">
      <div>`;
      return html;
    }

    let imageFileGroup = document.getElementsByClassName('img-file_group');
    let fileIndex = [1,2,3,4,5,6,7,8,9,10];
    let imageFile = document.getElementsByClassName('img-file');
    let lastIndex = imageFileGroup[imageFileGroup.length - 1].dataset.index;
    console.log(lastIndex)
    fileIndex.splice(0,lastIndex);
    let hiddenDestroy = document.getElementsByClassName('hidden-destroy');
    for( i = 0; i < hiddenDestroy.length; i++){
      hiddenDestroy[i].style.display = 'none';
    }

    let imageBoxPreviews = document.getElementById('exhibit__image-box__previews');
    let imageBoxUploaderLabel = document.getElementById('exhibit__image-box__uploader__label');
    let imageBoxUploader = document.getElementById('exhibit__image-box__uploader');
    delegateEvent(document,'change','.img-file',function(e) {
      const targetIndex = this.parentNode.dataset.index; 
      const file = e.target.files[0]; //画像ファイル自身
      const blobURL = window.URL.createObjectURL(file);
      
      //indexの値を見てimgにindexがあれば取得
      //for(let i = 0; i < imageFileGroup.length; i++){
        //let img = imageFileGroup[i].querySelectorAll(`img[data-index="${targetIndex}"]`);
        //console.log(img)
        //var img = `img[data-index="${targetIndex}"]`
        //console.log($(`img[data-index="${targetIndex}"]`));
        //console.log(img[0]);
        //if (img[0]){
          //console.log('blobURLをimage属性へ')
          //this.parentNode.setAttribute('image',blobURL);
        //}else{
          console.log(imageBoxPreviews);
          console.log(fileIndex);
          //for(let i = 0; i < imageBoxPreviews.length; i++){
          imageBoxPreviews.insertAdjacentHTML('afterbegin',buildImg(targetIndex, blobURL));
          //}
          //console.log(imageBoxPreviews.parentNode.appendchiild(buildImg(targetIndex, blobURL)));
          //for(let i = 0; i < imageBoxUploaderLabel.length; i++){
          imageBoxUploaderLabel.insertAdjacentHTML('beforeend',buildFileField(fileIndex[0]));
          //console.log(imageBoxUploaderLabel[i].insertAdjacentHTML('beforeend',buildFileField(fileIndex[i])));
          //console.log(this);
          
          this.style.display = 'none';
          //imageFile[i].style.display = 'none';
          //}
          //
          fileIndex.shift();
          fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
          console.log(fileIndex.push(fileIndex[fileIndex.length - 1] + 1));
        //}
      //}
    });
    
    //削除ボタンの設定
    delegateEvent(document ,'click' ,'.img-remove' , function(e){
      const targetIndex = this.previousElementSibling.dataset.index;
      console.log(targetIndex);
      const hiddenCheck = document.querySelectorAll(`input[data-index="${targetIndex}"].hidden-destroy`);
      console.log(hiddenCheck);
      if (hiddenCheck) hiddenCheck.checked = 'true';
      this.parentNode.remove();
      console.log(targetIndex);
      const divDataIndex = document.querySelectorAll(`div[data-index="${targetIndex}"]`);
      for(let i=0; i < divDataIndex.length; i++){
        divDataIndex[i].remove();
      };
      
      if (imageFile.length == 0) {
        for(let i = 0; i < imageBoxUploaderLabel.length; i++){
        imageBoxUploaderLabel[i].insertAdjacentHTML('beforeend', buildFileField(fileIndex[i]));
        };
      }
    });
    //画像のドロップエリア
    
      

    //for(let i = 0; i < imageBoxPreviews.length; i++ ){
      const observeDOMcontents = new MutationObserver( function( mutations ){
        mutations.forEach(function(mutation){
          console.log(`${mutation}`);
          adaptiveImageArea();
        })
      });
      const configObserver = {childList: true};//オブザーバの設定
      observeDOMcontents.observe(imageBoxPreviews , configObserver);
    //};

    //画像を放り込むエリアの定義
    function adaptiveImageArea (){
      let inputImages = document.getElementsByClassName('input__images');
      let imgCount = inputImages.length;//投稿画像の枚数
      console.log(`imgCount = ${imgCount}`);
      //10パターンの画像投稿エリア
          
      switch (imgCount){
        case 0:
          imageBoxPreviews.style.display = 'none';
          imageBoxUploader.style.width = '500%';
          imageBoxUploader.style.width = '100%';
          imageBoxUploader.style.gridColumnStart = '1';
          imageBoxUploader.style.gridRowStart = '1';
          break;
          
        case 1:
          imageBoxPreviews.style.display = 'grid';
          imageBoxPreviews.style.gridTemplateRows = 'repeat(1, 165px)';
          imageBoxPreviews.style.gridTemplateColumns = 'repeat(1, 120px)';
          imageBoxUploader.style.gridColumnStart = '2';
          imageBoxUploader.style.gridRowStart = '1';
          break;

      }

    };
  });

//EventDelegation
  function matches(elm, selector) {
    let matches = (elm.document || elm.ownerDocument).querySelectorAll(selector),
    i = matches.length;
    while (--i >= 0 && matches.item(i) !== elm) ;
    return i > -1;
  }
  
  function delegateEvent(root, eventType, selector, listener) {
    root.addEventListener(eventType, function(e) {
      let el = e.target;
      while (el && el !== root) {
        if (matches(el, selector)) {
          listener.call(el, e, el);
          break;
        }
        el = el.parentNode;
      }
    }, false);
  }

}