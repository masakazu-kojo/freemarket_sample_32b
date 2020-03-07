$(function(){
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    let html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  // サイズボックスのオプションを作成
  function appendSizeOption(category){
    let html = `<option value="${category.id}" data-category="${category.id}">${category.size}</option>`;
    return html;
  }
  // カテゴリー2の表示作成
  function appendCategoryParentBox(insertHTML){
    const html = `<select required="required" class="select_form" id= 'category_parent-form'>
                    <option value="">選択してください</option>
                    ${insertHTML}
                  </select>`;
    return html;
  }
  // カテゴリー3の表示作成
  function appendCategoryBox(insertHTML){
    const html = `<select required="required" class="select_form" name= 'item[category_id]'  id= 'category-form'>
                    <option value="">選択してください</option>
                    ${insertHTML}
                  </select>`;
    return html;
  }
  // サイズの表示作成
  function appendSizeBox(insertHTML){
    const html = `<div id="size-box">
                    <div class="container__sell-main__sell-box__item-container__cleafix__form-box__form-any">
                      <P>サイズ</P><span>任意</span>
                    </div>
                    <div class="container__sell-main__sell-box__item-container__cleafix__form-box__select">
                      <select class="select_form" name= 'item[size_id]'  id= 'size-box'>
                      <option value="">選択してください</option>
                      ${insertHTML}
                      </select>
                    </div>
                  </div>`;
    return html;
  }
  // ブランドの表示作成
  function appendBrandBox(){
    const html = `<div id="brand-box">
                    <div class="container__sell-main__sell-box__item-container__cleafix__form-box__form-any">
                      <p>ブランド</p><span>任意</span>
                    </div>
                    <div class="container__sell-main__sell-box__item-container__cleafix__form-box__form-brand">
                      <input placeholder="ブランド名" class="select_form" type="text" value="" name="brand[name]" id="brand_name">
                    </div>
                  </div>`;
    return html;
  }
  // カテゴリー1選択後のイベント
  $('#item_category_id').on('change', function(){
    var CategoryRootId = $('#category_root-box option:selected').val();  //選択されたカテゴリー1のIDを取得
    if (CategoryRootId != ""){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: '/items/get_category_parent',
        type: 'GET',
        data: { category_root_id: CategoryRootId },
        dataType: 'json'
      })
      .done(function(categorys_parent){
        $('#category_parent-form').remove(); //親が変更された時、子以下を削除するする
        $('#category-form').remove();
        $('#size-box').remove();
        $('#brand-box').remove();
        let insertHTML = '';
        categorys_parent.forEach(function(categorys_parent){
          insertHTML += appendOption(categorys_parent);
        });
        $('#category_root-box').append(appendCategoryParentBox(insertHTML));

      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#category_parent-form').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
      $('#category-form').remove();
      $('#size-box').remove();
      $('#brand-box').remove();
    }
  });
  // カテゴリー2選択後のイベント
  $('.category-box').on('change', '#category_parent-form',function(){
    var CategoryParentId = $('#category_parent-form option:selected').val();  //選択されたカテゴリー2のIDを取得
    if (CategoryParentId != ""){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: '/items/get_category',
        type: 'GET',
        data: { category_parent_id: CategoryParentId },
        dataType: 'json'
      })
      .done(function(categorys){
        $('#category-form').remove(); //親が変更された時、子以下を削除するする
        $('#size-box').remove();
        $('#brand-box').remove();
        let insertHTML = '';
        categorys.forEach(function(category){
          insertHTML += appendOption(category);
        });
        $('#category_root-box').append(appendCategoryBox(insertHTML));
        $('#after_brand').before(appendBrandBox());
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#category-form').remove(); //カテゴリー3が初期値になった時、子以下を削除するする
      $('#size-box').remove();
      $('#brand-box').remove();
    }
  });
  // カテゴリー3選択後のイベント
  $('.category-box').on('change', '#category-form',function(){
    var CategoryId = $('#category-form option:selected').val();  //選択されたカテゴリー3のIDを取得
    if (CategoryId != ""){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: '/items/get_size',
        type: 'GET',
        data: { category_id: CategoryId },
        dataType: 'json'
      })
      .done(function(sizes){
        $('#size-box').remove();
        let insertHTML = '';
        sizes.forEach(function(size){
          insertHTML += appendSizeOption(size);
        });
        $('#category-list').after(appendSizeBox(insertHTML));
      })
    }else{
      $('#size-box').remove();
    }
  });
});