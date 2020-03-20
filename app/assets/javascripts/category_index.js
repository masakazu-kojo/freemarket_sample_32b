$(function(){
  // カテゴリーページ
  $('.category-list-nav__list').on('click',function(){
    let category_data = $(this).data('index');
    $('html,body').animate({ scrollTop: $(`div[name="category-index-${category_data}"]`).offset().top});
  });
  // ブランドページ
  $('.brand-index').on('click',function(){
    let brand_data = $(this).data('index');
    $('html,body').animate({ scrollTop: $(`div[name="brand-index-${brand_data}"]`).offset().top});
  });
  // 最上部に戻る
  $('.scroll-top').on('click',function(){
    $('html,body').animate({ scrollTop: 0});
  });

});