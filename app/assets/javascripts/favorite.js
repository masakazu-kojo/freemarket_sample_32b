$(function(){
  // お気に入りボタン貼り付け用
  function appendFavoriteOn(item_id, like_total){
    let html = `<div class="favorite_btn_on" data-index="${item_id}">
                <i class="fas fa-heart" id="favorite_btn_on" style="color: red;">
                </i></div>
                <div class="like_total" style="color: red;">
                ${like_total}
                </div>`;
    return html;
  }
  function appendFavoriteOff(item_id, like_total){
    let html = `<div class="favorite_btn_off" data-index="${item_id}">
                <i class="far fa-heart" id="favorite_btn_off">
                </i></div>
                <div class="like_total">
                ${like_total}
                </div>`;
    return html;
  }

  // お気に入り選択のイベント
  $('.items-box__body__num__like').on('click', '.favorite_btn_off',function(){
    let itemId = $(this).data('index');
    let thisparent = $(this).parent();
    $.ajax({
      url: '/favorites',
      type: 'POST',
      data: { item_id: itemId },
      dataType: 'json'
    })
    .done(function(f_data){
      let like_total = f_data.like_total+1;
      let item_id = f_data.item_id;
      // オフアイコン削除
      thisparent.empty();
      // オンアイコン貼り付け
      thisparent.append(appendFavoriteOn(item_id, like_total));
    })
  });

  // お気に入り取り消しのイベント
  $('.items-box__body__num__like').on('click', '.favorite_btn_on',function(){
    let itemId = $(this).data('index');
    let thisparent = $(this).parent();
    $.ajax({
      url: `/favorites/${itemId}`,
      type: 'DELETE',
      data: { item_id: itemId },
      dataType: 'json'
    })
    .done(function(f_data){
      let like_total = f_data.like_total-1;
      let item_id = f_data.item_id;
      // オンアイコン削除
      thisparent.empty();
      // オフアイコン貼り付け(0の時は数値を非表示)
      if (like_total > 0) {
        thisparent.append(appendFavoriteOff(item_id, like_total));
      }else {
        like_total = "";
        thisparent.append(appendFavoriteOff(item_id, like_total));
      }
    })
  });
});