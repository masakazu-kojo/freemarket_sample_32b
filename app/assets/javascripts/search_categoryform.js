$(function(){
  function appendOption(category){
    let html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendCheckbox(category){
    let html = `<div class="searchSidebar__type__checkfield__label">
                  <div class="searchSidebar__type__checkfield__label--check">
                    <input type="checkbox" value="${category.id}" name="q[category_id_in][]" id="${"q_category_id_in_" + category.id}">
                  </div>
                  <div class="searchSidebar__type__checkfield__label--name">
                    <label for="${"q_category_id_in_" + category.id}">${category.name}
                    </label>
                  </div>
                </div>`;
    return html;
  }
  function appendCategoryParentBox(insertHTML){
    const html = `<select required="required" id="search_parentcategory"   class="searchSidebar__type--textbox">
                    <option value="">選択してください</option>
                    ${insertHTML}
                  </select>`;
    return html;
  }
  function appendCategoryBox(insertHTML){
    const html = `<div class="searchSidebar__type__checkfield" id="search_categoryCheckbox">
                    ${insertHTML}
                  </div>`;
    return html;
  }

  // カテゴリー1選択後のイベント
  $('#search_rootcategory').on('change', function(){
    var CategoryRootId = $('#search_rootcategory option:selected').val();
    if (CategoryRootId != ""){
      $.ajax({
        url: '/items/get_category_parent',
        type: 'GET',
        data: { category_root_id: CategoryRootId },
        dataType: 'json'
      })
      .done(function(categories_parent){
        $('#search_parentcategory').remove();
        $('#search_categoryCheckbox').remove();
        let insertHTML = '';
        categories_parent.forEach(function(categories_parent){
          insertHTML += appendOption(categories_parent);
        });
        $('#searchCategory').append(appendCategoryParentBox(insertHTML));

      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#search_parentcategory').remove();
      $('#search_categoryCheckbox').remove();
    }
  });
  // カテゴリー2選択後のイベント
  $('#searchCategory').on('change', '#search_parentcategory', function(){
    var CategoryParentId = $('#search_parentcategory option:selected').val();
    if (CategoryParentId != ""){ 
      $.ajax({
        url: '/items/get_category',
        type: 'GET',
        data: { category_parent_id: CategoryParentId },
        dataType: 'json'
      })
      .done(function(categories){
        $('#search_categoryCheckbox').remove();
        let insertHTML = '';
        categories.forEach(function(category){
          insertHTML += appendCheckbox(category);
        });
        $('#searchCategory').append(appendCategoryBox(insertHTML));
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#search_categoryCheckbox').remove();
    }
  });
});