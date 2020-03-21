class Address < ApplicationRecord
  validates :send_familyname, presence: true
  validates :send_firstname, presence: true
  validates :send_familyname_kana, presence: true
  validates :send_firstname_kana, presence: true
  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :municipality, presence: true
  validates :house_number, presence: true

  belongs_to :user
end
