class UsersController < ApplicationController
  # def index

  # end

  def new
    @user = User.new
    @user.identities.build
  end

  def create
    @user = current_user.identities.build(identities_params)
    @user.save
    # redirect_to users_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, identities_attributes:[:id, :familyname, :firstname, :familyname_kana, :firstname_kana, :birthday])
  end

end