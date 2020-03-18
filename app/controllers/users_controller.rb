class UsersController < ApplicationController
  def index
  end
  
  def like
    @favorites = Favorite.where(user_id: current_user.id)
  end
end
