class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.save
    respond_to do |format|
      format.json
    end
  end
  
  def destroy
    @favorite = Favorite.where(favorite_params)[0]
    @favorite.delete
  end

  private
  
  def favorite_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

end
