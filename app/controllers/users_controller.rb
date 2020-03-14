class UsersController < ApplicationController
  def index
  end

  # def new
  # end

  # def create
  #   @user = User.new(user_params)
  #   binding.pry
  #   # @user.adresses.build
  #   @user.save
  #   redirect_to users_path(@user)
  # end

  # private
  # def identity_params
  #   params.require(:user).permit(:nickname, identities_attributes:[:familyname, :firstname, :familyname_kana, :firstname_kana, :birthday])
  # end

end