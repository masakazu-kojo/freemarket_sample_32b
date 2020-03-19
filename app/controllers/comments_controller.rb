class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.json
      end
    else
      flash.now[:alert] = '投稿に失敗しました'
    end
  end

  private
  
  def comment_params
    params.permit(:comment, :item_id).merge(user_id: current_user.id)
  end
end
