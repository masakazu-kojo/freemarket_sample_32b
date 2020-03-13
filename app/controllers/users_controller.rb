class UsersController < ApplicationController
  def new
    @user = User.new
  end
  

  def like
    @favorites = Favorite.where(user_id: current_user.id)
  end
end
