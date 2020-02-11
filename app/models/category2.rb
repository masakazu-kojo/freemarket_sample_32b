class Category2 < ApplicationRecord

  has_many :category3s
  belongs_to :category1
  # has_many :items

end
