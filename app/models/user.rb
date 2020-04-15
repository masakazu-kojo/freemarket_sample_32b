class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    user
  end


  has_many :sns_credentials
  has_one :identity, dependent: :destroy
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :identity
  # accepts_nested_attributes_for :address
  #ニックネームが必須
  validates :nickname, presence: true
  #メールアドレスは一意である
  validates :email, uniqueness: true
  #パスワードが必須 #パスワードは7文字以上
  validates :password, confirmation: true, length: { minimum: 7 }
  #パスワードは確認用を含めて2回入力する
  validates :password_confirmation, presence: true
  

  has_many :credit_cards
  has_many :items
  has_many :tradings
  has_many :favorites, dependent: :destroy
  has_many :comments
  has_many :purchases
end