class Category1 < ApplicationRecord

  # has_many :category2s
  # has_many :category3s, through: :category2s
  has_many :items

end
