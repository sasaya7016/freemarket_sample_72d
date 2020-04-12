if (document.location.href.match(/\/items\/new/)){
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
      console.log(imageFileGroup);
      console.log(targetIndex);
      
    })
>>>>>>> Stashed changes
  });
}