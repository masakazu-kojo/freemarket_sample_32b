class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:new, :create]

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(identity_params)
    if @user.save
      sign_in @user
      redirect_to root_path
    elsif params[:sns_auth] == 'true'
      pass = Devise.friendly_token
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
    else
      render :new
    end
    # super
  end

  protected
  # # アカウント編集後、プロフィール画面に移動する
  # def after_update_path_for(resource)
  #   user_path(id: current_user.id)
  # end
  
  # # パスワード入れずにユーザー編集
  # def update_resource(resource, params)
  #   resource.update_without_password(params)
  # end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  private
  def identity_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, identity_attributes:[:id, :familyname, :firstname, :familyname_kana, :firstname_kana, :birthday])
  end

end
