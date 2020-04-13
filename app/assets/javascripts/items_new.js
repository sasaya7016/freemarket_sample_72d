if (document.location.href.match(/\/items\/new/)){
  document.addEventListener('DOMContentLoaded',()=>{
    //preview生成
      //削除ボタン生成
    const buildImg = (index ,url ) => {
      const html = `
      <div data-index="${index}" class="exhibit__image-box__previews__preview">
        <div class="exhibit__image-box__previews__preview__image">
          <img class="image${index} input__images" data-index="${index}" src="${url}" width="120px" height="120px">
          <div class="exhibit__image-box__previews__preview__delete image-remove-btn">
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

    //let droparea = document.getElementById('exhibit__image-box');
    let imageFileGroup = document.getElementsByClassName('img-file_group');
    //console.log(imageFileGroup);
    let fileIndex = [1,2,3,4,5,6,7,8,9,10];
    //console.log(imageFileGroup[imageFileGroup.length - 1]);
    let lastIndex = imageFileGroup[imageFileGroup.length - 1].dataset.index;
    fileIndex.splice(0,lastIndex);
    //console.log(lastIndex);
    //console.log(fileIndex);
    //console.log(fileIndex.splice(0,lastIndex));


    delegateEvent(document,'change','.img-file',function(e) {
      //let imageFileGroup = document.getElementsByClassName('img-file_group');
      //console.log(imageFileGroup[0]);
      //console.log(this);
      //console.log(this.parentNode.dataset.index);
      const targetIndex = this.parentNode.dataset.index;
      //console.log(targetIndex);
      const file = e.target.files[0];
      //console.log(file);
      //console.log(window.URL.createObjectURL(file));
      const blobURL = window.URL.createObjectURL(file);
      let imageFile = document.getElementsByClassName('img-file')
      let imageBoxPreviews = document.getElementsByClassName('exhibit__image-box__previews');
      let imageBoxUploaderLabel = document.getElementsByClassName('exhibit-image-box__uploader__label');
      

      //indexの値を見てimgにindexがあれば取得
      //for(let i = 0; i < imageFileGroup.length; i++){
        let img = imageFileGroup[0].querySelectorAll(`img[data-index="${targetIndex}"]`);
        //var img = `img[data-index="${targetIndex}"]`
        console.log($(`img[data-index="${targetIndex}"]`));
        console.log(img);
        if (img[0]){
          console.log('blobURLをimage属性へ')
          this.parentNode.setAttribute('image',blobURL);
        }else{
          console.log(imageBoxPreviews);
          for(let i = 0; i < imageBoxPreviews.length; i++){
            //console.log(imageBoxPreviews[i].parentNode);
            //console.log(imageBoxPreviews[i])
            imageBoxPreviews[i].insertAdjacentHTML('afterbegin',buildImg(targetIndex, blobURL));
          }
          //console.log(imageBoxPreviews.parentNode.appendchiild(buildImg(targetIndex, blobURL)));
          for(let i = 0; i < imageBoxUploaderLabel.length; i++){
          imageBoxUploaderLabel[i].insertAdjacentHTML('beforeend',buildFileField(fileIndex[i]));
          //console.log(imageBoxUploaderLabel[i].insertAdjacentHTML('beforeend',buildFileField(fileIndex[i])));
          //console.log(this);
          this.style.display = 'none';
          //imageFile[i].style.display = 'none';
          }//この辺りの記述なんとかする
          
          //inputが多数生成される問題を解決する。
          fileIndex.shift();

          fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
          console.log(fileIndex.push(fileIndex[fileIndex.length - 1] + 1));
        }
    //}
    });
    
    //削除ボタンの設定
    delegateEvent(document ,'click' ,'.' , function(){
      
    });
    //画像のinsert
  });





//EventDelegation
  function matches(elm, selector) {
    var matches = (elm.document || elm.ownerDocument).querySelectorAll(selector),
    i = matches.length;
    while (--i >= 0 && matches.item(i) !== elm) ;
    return i > -1;
  }
  
  function delegateEvent(root, eventType, selector, listener) {
    root.addEventListener(eventType, function(e) {
      var el = e.target;
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