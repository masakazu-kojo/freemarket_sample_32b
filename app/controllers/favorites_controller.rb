class FavoritesController < ApplicationController

  def create
    @like_total = Favorite.where(item_id: favorite_params[:item_id]).count
    @favorite = Favorite.new(favorite_params)
    @favorite.save
    respond_to do |format|
      format.json
    end
  end
  
  def destroy
    @like_total = Favorite.where(item_id: favorite_params[:item_id]).count
    @favorite = Favorite.where(favorite_params)[0]
    @favorite.delete
    respond_to do |format|
      format.json
    end
  end

  private
  
  def favorite_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

end
