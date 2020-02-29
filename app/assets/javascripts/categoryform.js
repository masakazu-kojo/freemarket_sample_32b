$(function(){
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    let html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  // カテゴリー2の表示作成
  function appendCategory2Box(insertHTML){
    const html = `<select required="required" class="select_form" id= 'category2-form'>
                    <option value="">選択してください</option>
                    ${insertHTML}
                  </select>`;
    return html;
  }
  // カテゴリー3の表示作成
  function appendCategory3Box(insertHTML){
    const html = `<select required="required" class="select_form" name= 'item[category_id]'  id= 'category3-form'>
                    <option value="">選択してください</option>
                    ${insertHTML}
                  </select>`;
    return html;
  }
  // カテゴリー1選択後のイベント
  $('#item_category_id').on('change', function(){
    var Category1Id = $('#category1-box option:selected').val();  //選択されたカテゴリー1のIDを取得
    if (Category1Id != ""){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: '/items/get_category2',
        type: 'GET',
        data: { category1_id: Category1Id },
        dataType: 'json'
      })
      .done(function(category2s){
        $('#category2-form').remove(); //親が変更された時、子以下を削除するする
        $('#category3-form').remove();
        $('#size-box').css('display','none');
        $('#brand-box').css('display','none');
        let insertHTML = '';
        category2s.forEach(function(category2){
          insertHTML += appendOption(category2);
        });
        $('#category1-box').append(appendCategory2Box(insertHTML));

      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#category2-form').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
      $('#category3-form').remove();
      $('#size-box').css('display','none');
      $('#brand-box').css('display','none');
    }
  });
  // カテゴリー2選択後のイベント
  $('.category-box').on('change', '#category2-form',function(){
    var Category2Id = $('#category2-form option:selected').val();  //選択されたカテゴリー2のIDを取得
    if (Category2Id != ""){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: '/items/get_category3',
        type: 'GET',
        data: { category2_id: Category2Id },
        dataType: 'json'
      })
      .done(function(category3s){
        $('#category3-form').remove(); //親が変更された時、子以下を削除するする
        $('#size-box').css('display','none');
        $('#brand-box').css('display','none');
        let insertHTML = '';
        category3s.forEach(function(category3){
          insertHTML += appendOption(category3);
        });
        $('#category1-box').append(appendCategory3Box(insertHTML));
        // $('#size-box').css('display','block');
        $('#brand-box').css('display','block');
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#category3-form').remove(); //カテゴリー3が初期値になった時、子以下を削除するする
      $('#size-box').css('display','none');
      $('#brand-box').css('display','none');
    }
  });
  // カテゴリー3選択後のイベント
  $('.category-box').on('change', '#category3-form',function(){
    var Category3Id = $('#category3-form option:selected').val();  //選択されたカテゴリー3のIDを取得
    if (Category3Id != ""){ //親カテゴリーが初期値でないことを確認
      $('#size-box').css('display','block');
    }else{
      $('#size-box').css('display','none');
    }
  });
});