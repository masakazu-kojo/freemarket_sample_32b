$(function(){
  Payjp.setPublicKey("pk_test_6c53e5c444a17f09ba2c3e4b");

  // カード情報の登録

  const btn = $('#token_submit');
  btn.on('click', function(e) {
        e.preventDefault()
        // カード情報生成
        const card = {
          number:    $('#card_number').val(),
          cvc:       $('#cvc').val(),
          exp_month: $('#exp_month').val(),
          exp_year:  $('#exp_year').val()
        };
    // トークン生成
    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        $("#card_number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name"); //データを自サーバにpostしないように削除

        // 取得したトークンを送信できる状態にして送信
        $("#card_token").append(
        $('<input type="hidden" name="payjp-token">').val(response.id));
        document.cardInputForm.submit();
        
        alert("登録が完了しました"); //確認用
      } else {
        alert("カード情報が正しくありません。"); //確認用
      }
    });
  })

  // カード情報変更確認

  var preventEvent = true;

  $("#deleteCardForm").on('submit', function(e){
    if (preventEvent) {
      e.preventDefault()
      var cardChange = window.confirm("現在登録されているクレジットカード情報は削除されます。\n本当によろしいですか？")
      if (cardChange) {
        preventEvent = false;
        $('#deleteCardForm').submit();
      }
    }
  })
});