$(function(){
  // お気に入りボタン貼り付け用
  function appendFavoriteOn(){
    let html = `<i class="fas fa-heart" id="favorite_btn_on" style="color: red;"></i>`;
    return html;
  }
  function appendFavoriteOff(){
    let html = `<i class="far fa-heart" id="favorite_btn_off"></i>`;
    return html;
  }

  // お気に入り選択のイベント
  $('#favorite_btn_off').on('click', function(){
    let itemId = $(this).parent().data('index')
    $.ajax({
      url: '/favorites',
      type: 'POST',
      data: { item_id: itemId },
      dataType: 'json'
    })
    .done(function(favorite_num){
      console.log("on成功");
      // オフアイコン削除
      $('.hidden-favorite_on').css("display", "none");
      $('.appeared-favorite_off').css("display", "none");
      // オンアイコン貼り付け
      $('.appeared-favorite_on').css("display", "block");
      $('.hidden-favorite_off').css("display", "block");
    })
    .fail(function() {
      console.log("on失敗");
    });
  });
  // お気に入り取り消しのイベント
  $('#favorite_btn_on').on('click', function(){
    let itemId = $(this).parent().data('index')
    $.ajax({
      url: `/favorites/${itemId}`,
      type: 'DELETE',
      data: { item_id: itemId },
      dataType: 'json'
    })
    .done(function(favorite_num){
      console.log("off成功");
      // オンアイコン削除
      $('.appeared-favorite_on').css("display", "none");
      $('.hidden-favorite_off').css("display", "none");
      // オフアイコン貼り付け
      $('.hidden-favorite_on').css("display", "block");
      $('.appeared-favorite_off').css("display", "block");
    })
    .fail(function() {
      console.log("off失敗");
    });
  });


});