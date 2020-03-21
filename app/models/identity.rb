class Identity < ApplicationRecord
  
  #ユーザー本名カナは必須、全角で入力させる
  validates :familyname, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :firstname, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  #ユーザー本名のふりがなは全角で入力させる
  validates :familyname_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :firstname_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  #生年月日が必須
  validates :birthday, presence: true
  
  belongs_to :user
end
