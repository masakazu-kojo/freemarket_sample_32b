class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
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