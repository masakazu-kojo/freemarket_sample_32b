$(function(){
  // お気に入りボタン貼り付け用
  function appendFavoriteOn(item_id, like_total){
    let html = `<div class="show_favorite_btn" data-index="${item_id}" id="show_favorite_btn_on">
                  <i class="fas fa-heart" style="color: red;">
                  </i>
                  <text> いいね！ ${like_total}</text>
                </div>`;
    return html;
  }
  function appendFavoriteOff(item_id, like_total){
    let html = `<div class="show_favorite_btn" data-index="${item_id}" id="show_favorite_btn_off">
                  <i class="far fa-heart">
                  </i>
                  <text> いいね！ ${like_total}</text>
                </div>`;
    return html;
  }

  // お気に入り選択のイベント
  $('.show_favorite_box').on('click', '#show_favorite_btn_off',function(){
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
      $('#show_favorite_btn_on').css('border','tomato 1px solid');
    })
  });

  // お気に入り取り消しのイベント
  $('.show_favorite_box').on('click', '#show_favorite_btn_on',function(){
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
      thisparent.append(appendFavoriteOff(item_id, like_total));
    })
  });
});