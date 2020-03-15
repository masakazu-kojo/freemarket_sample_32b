class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    respond_to do |format|
      format.json
    end
  end

  private
  
  def comment_params
    params.permit(:comment, :item_id).merge(user_id: current_user.id)
  end
end
