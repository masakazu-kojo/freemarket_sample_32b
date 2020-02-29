$(function(){
  // 画像用のinputを生成する関数
  function buildFileField(index){
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="file_upload" type="file"
                    name="item[images_attributes][${index}][image]"
                    id="item_images_attributes_${index}_image"><br>
                  </div>`;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  function buildImg(index, url){
    const html = `<div data-index="${index}" class="upload-box-image">
                    <div class="upload-box-image__photo">
                      <img data-index="${index}" src="${url}" width="120px" height="118px">
                    </div>
                    <div data-index="${index}" class="upload-box-image__remove">削除</div>
                  </div>`;
    return html;
  }
  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  let image_count = [];
  // // 既に使われているindexを除外
  // lastIndex = $('.js-file_group:last').data('index');
  // fileIndex.splice(0, lastIndex);
  // $('.hidden-destroy').hide();

  $('#upload-box').on('change', '.file_upload', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // 該当indexを持つimgタグがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#item-previews').prepend(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#upload-box').prepend(buildFileField(fileIndex[0]));
      image_count.push(fileIndex[0]);
      if (image_count.length >= 1 && image_count.length <= 4) {
        $('#upload-box').css('width','-=20%');
      } else if (image_count.length == 5) {
        $('#upload-box').css('width','+=80%');
      } else if (image_count.length >= 6 && image_count.length <= 9) {
        $('#upload-box').css('width','-=20%');
      } else {
        $('#upload-box').css('display','none');
      }
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
  });

  $('#item-previews').on('click', '.upload-box-image__remove', function() {
    const targetIndex = $(this).parent().data('index')
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    // if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
    $(`img[data-index="${targetIndex}"]`).remove();
    $(`.js-file_group[data-index="${targetIndex}"]`).remove();
    image_count.shift();
    if (image_count.length == 9) {
      $('#upload-box').css('display','inline-block');
    } else if (image_count.length >= 5 && image_count.length <= 8) {
      $('#upload-box').css('width','+=20%');
    } else if (image_count.length == 4) {
      $('#upload-box').css('width','-=80%');
    } else {
      $('#upload-box').css('width','+=20%');
    }
  });
  // バリデーション
  $('#item_submit').on('click', function(){
    let item_name = $('#item_name').val();
    let item_explanation = $('#item_explanation').val();
    let item_category = $('#item_category_id').val();
    let item_condition = $('#item_condition').val();
    let item_sent_charge = $('#item_sent_charge').val();
    let item_shipping_area = $('#item_shipping_area').val();
    let item_days_to_ship = $('#item_days_to_ship').val();
    let item_price = $('#item_price').val();
    // 画像
    if (image_count.length == 0){
      $('#item_image_invalid').css('display','block');
    }else{
      $('#item_image_invalid').css('display','none');
    }
    // 商品名
    if (item_name == ""){
      $('#item_name_invalid').css('display','block');
      $('#item_name').css('border','tomato 1px solid');
    }else{
      $('#item_name_invalid').css('display','none');
      $('#item_name').css('border','1px solid #ccc');
    }
    // 商品説明
    if (item_explanation == ""){
      $('#item_explanation_invalid').css('display','block');
      $('#item_explanation').css('border','tomato 1px solid');
    }else{
      $('#item_explanation_invalid').css('display','none');
      $('#item_explanation').css('border','1px solid #ccc');
    }
    // カテゴリー
    if (item_category == ""){
      $('#category-box_invalid').css('display','block');
      $('#item_category_id').css('border','tomato 1px solid');
    }else{
      $('#category-box_invalid').css('display','none');
      $('#item_category_id').css('border','1px solid #ccc');
    }
    // 商品の状態
    if (item_condition == ""){
      $('#item_condition_invalid').css('display','block');
      $('#item_condition').css('border','tomato 1px solid');
    }else{
      $('#item_condition_invalid').css('display','none');
      $('#item_condition').css('border','1px solid #ccc');
    }
    // 配送料の負担
    if (item_sent_charge == ""){
      $('#item_sent_charge_invalid').css('display','block');
      $('#item_sent_charge').css('border','tomato 1px solid');
    }else{
      $('#item_sent_charge_invalid').css('display','none');
      $('#item_sent_charge').css('border','1px solid #ccc');
    }
    // 発送元の地域
    if (item_shipping_area == ""){
      $('#item_shipping_area_invalid').css('display','block');
      $('#item_shipping_area').css('border','tomato 1px solid');
    }else{
      $('#item_shipping_area_invalid').css('display','none');
      $('#item_shipping_area').css('border','1px solid #ccc');
    }
    // 発送までの日数
    if (item_days_to_ship == ""){
      $('#item_days_to_ship_invalid').css('display','block');
      $('#item_days_to_ship').css('border','tomato 1px solid');
    }else{
      $('#item_days_to_ship_invalid').css('display','none');
      $('#item_days_to_ship').css('border','1px solid #ccc');
    }
    // 販売価格
    if (item_price == ""){
      $('#item_price_invalid').css('display','block');
      $('#item_price').css('border','tomato 1px solid');
    }else{
      $('#item_price_invalid').css('display','none');
      $('#item_price').css('border','1px solid #ccc');
    }


  });
});
