$(function(){
  
  $('.category-list-nav__list').on('click',function(){
    let category_data = $(this).data('index');
    $('html,body').animate({ scrollTop: $(`div[name="category-index-${category_data}"]`).offset().top});
  });
  
  $('.scroll-top').on('click',function(){
    $('html,body').animate({ scrollTop: 0});
  });

});