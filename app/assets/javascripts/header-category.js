$(function(){
  // カテゴリー親のセレクトボックスのオプションを作成
  function appendParentOption(categoryId, categoryName){
    let html = `<div class="category-list__box__select__contents category-js-parent__contents" data-index="${categoryId}">
                  <a href="/categories/${categoryId}">${categoryName}</a>
                </div>`;
    return html;
  }
  // カテゴリーのセレクトボックスのオプションを作成
  function appendOption(categoryId, categoryName){
    let html = `<div class="category-list__box__select__contents category-js__contents" data-index="${categoryId}">
                  <a href="/categories/${categoryId}">${categoryName}</a>
                </div>`;
    return html;
  }
  // rootを表示
  $('.header__nav__left--category').on('mouseover',function(){
    $('.category-list').css('display','block');
  });
  // rootからidを取得
  $('.category-js-root__contents').on('mouseover' ,function(){
    let CategoryRootId = $(this).data('index');
    $.ajax({
      url: '/items/get_category_parent',
      type: 'GET',
      data: { category_root_id: CategoryRootId },
      dataType: 'json'
    })
    .done(function(category_parents){
      $('.category-js-parent').empty(); 
      $('.category-js-parent').css('display','block');
      let insertHTML = '';
      category_parents.forEach(function(category_parent){
        insertHTML += appendParentOption(category_parent.id, category_parent.name);
      });
      $('.category-js-parent').append(insertHTML);
    })
  });
  // parentからidを取得
  $('.category-js-parent').on('mouseover', '.category-js-parent__contents',function(){
    let CategoryParentId = $(this).data('index');
    $.ajax({
      url: '/items/get_category',
      type: 'GET',
      data: { category_parent_id: CategoryParentId },
      dataType: 'json'
    })
    .done(function(categories){
      $('.category-js').empty(); 
      $('.category-js').css('display','block');
      let insertHTML = '';
      categories.forEach(function(category){
        insertHTML += appendOption(category.id, category.name);
      });
      $('.category-js').append(insertHTML);
    })
  });
  // カテゴリー一覧オフ
  $('.header__nav__left--category').on('mouseout',function(){
    $('.category-list').css('display','none');
  });
  $('.category-list__nav').on('mouseover',function(){
    $('.category-js-parent').css('display','none');
  });
  $('.category-js-root').on('mouseover',function(){
    $('.category-js').css('display','none');
  });
  // brandを表示
  $('.header__nav__left--brand').on('mouseover',function(){
    $('.brand-list').css('display','block');
  });
  // brandオフ
  $('.header__nav__left--brand').on('mouseout',function(){
    $('.brand-list').css('display','none');
  });
});