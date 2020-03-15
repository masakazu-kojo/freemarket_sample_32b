class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:new, :create]

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(identity_params)
    # 後ほど使用
    # @user.build_identity
    # @user.adresses.build
    @user.save
    redirect_to users_path #とりあえずマイページへ
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  private
  def identity_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, identity_attributes:[:id, :familyname, :firstname, :familyname_kana, :firstname_kana, :birthday])
  end

end
