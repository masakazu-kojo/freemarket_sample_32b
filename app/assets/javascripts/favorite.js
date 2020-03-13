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
      console.log(like_total);
      // console.log(like_total);
      console.log("on成功");
      // オフアイコン削除
      thisparent.empty();
      
      // オンアイコン貼り付け
      thisparent.append(appendFavoriteOn(item_id, like_total));

    })
    .fail(function() {
      console.log("on失敗");
    });
  });

  // お気に入り取り消しのイベント
  $('.items-box__body__num__like').on('click', '.favorite_btn_on',function(){
    let itemId = $(this).data('index')
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
      console.log(like_total);
      // console.log(like_total);
      console.log("off成功");
      // オンアイコン削除
      thisparent.empty();
      // オフアイコン貼り付け
      thisparent.append(appendFavoriteOff(item_id, like_total));
    })
    .fail(function() {
      console.log("off失敗");
    });
  });


});