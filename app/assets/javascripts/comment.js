$(function(){
  // コメント貼り付け用
  function appendComment(userName,comment,createdAt,timeAgo){
    let html = `<li class="message-list"><div class="message-user">
                    <div class="message-user__name">
                      ${userName}
                    </div>
                  </div>
                  <div class="message-body">
                    <div class="message-body-text">
                      ${comment}
                    </div>
                    <div class="message-icons">
                      <div class="message-icon-left">
                        <i class="far fa-clock"></i>
                        <time datetime="${createdAt}">
                          ${timeAgo}前
                        </time>
                      </div>
                    </div>
                  </div></li>`;
    return html;
  }
  // 出品者のコメント貼り付け用
  function appendSellerComment(userName,comment,createdAt,timeAgo){
    let html = `<li class="message-list"><div class="message-user">
                    <div class="message-user__name">
                      ${userName}
                    </div>
                    <div class="message-user__is-seller">
                      出品者
                    </div>
                  </div>
                  <div class="message-body">
                    <div class="message-body-text">
                      ${comment}
                    </div>
                    <div class="message-icons">
                      <div class="message-icon-left">
                        <i class="far fa-clock"></i>
                        <time datetime="${createdAt}">
                          ${timeAgo}前
                        </time>
                      </div>
                    </div>
                  </div></li>`;
    return html;
  }
  $('#comment-button').on('click', function(){
    if ($('#comment-form').val() != ""){
      $('.comment-error').css('display','none');
      let text = $('#comment-form').val();
      let itemId = $(this).data('index');
      let currentId = $(this).data('current');
      let itemUserId = $(this).data('item');
      $.ajax({
        url: '/comments',
        type: 'POST',
        data: { comment: text, item_id: itemId },
        dataType: 'json'
      })
      .done(function(t_data){
        let userName = t_data.userName;
        let comment = t_data.comment;
        let createdAt = t_data.created_at;
        let timeAgo = t_data.timeAgo;
        // textarea削除
        $('#comment-form').val("");
        if (currentId == itemUserId) {
        // 出品者のコメント貼り付け
        $('.message-items').append(appendSellerComment(userName,comment,createdAt,timeAgo));
        }else{
        // コメント貼り付け
        $('.message-items').append(appendComment(userName,comment,createdAt,timeAgo));
        }
      })
    }else{
      $('.comment-error').css('display','block');
    }
  });
});