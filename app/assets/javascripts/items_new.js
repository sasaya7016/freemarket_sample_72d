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
      
    })
>>>>>>> Stashed changes
  });
}