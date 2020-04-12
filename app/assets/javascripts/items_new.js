if (document.location.href.match(/\/items\/new/)){
  document.addEventListener('DOMContentLoaded',()=>{
    //preview生成
      //削除ボタン生成
    const buildImg = (index ,url ) => {
      const html = `
      <div data-index="${index}" class="exhibit__image-box__previews__preview">
        <div class="exhibit__image-box__previews__preview__image">
          <img class="image${index} input__images" data-index="${index} src="${url}" width="120px" height="120px">
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
    let fileIndex = [1,2,3,4,5,6,7,8,9,10];
    let lastIndex = imageFileGroup[imageFileGroup.length - 1].dataset.index;
    fileIndex.splice(0,lastIndex);
    console.log(imageFileGroup);
    console.log(imageFileGroup[imageFileGroup.length - 1]);
    console.log(lastIndex);
    console.log(fileIndex);
    console.log(fileIndex.splice(0,lastIndex));


    delegateEvent(document,'change','.img-file',(e) => {
      //let imageFileGroup = document.getElementsByClassName('img-file_group');
      console.log(imageFileGroup);
      const targetIndex = imageFileGroup.dataset.index;
      console.log(targetIndex);
      const file = e.target.files[0];
      const blobURL = window.URL.createObjectURL(file);
      let imageBoxPreviews = document.getElementsByClassName('exhibit__image-box__previews');
      let imageBoxUploaderLabelParent = document.getElementsByClassName('exhibit-image-box__uploader__label').parentNode;
      
      //indexの値を見てimgにindexがあれば取得
      if (img = `img[data-index="${targetIndex}"]`[0]){
        img.setAttribute('image',blobURL)
      }else{
        imageBoxPreviews.parentNode.appendchiild(buildImg(targetIndex, blobURL));
        imageBoxUploaderLabelParent.insertBefore(buildFileField(fileIndex[0]),imageBoxUploaderLabelParent.firstElementChild);
        this.style.display = 'none';
        fileIndex.shift();

        fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
      }
    });
    
    //削除ボタンの設定

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