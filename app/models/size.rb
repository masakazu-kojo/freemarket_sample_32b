class Size < ApplicationRecord
  has_many :items
  has_many :category_sizes
  has_many :categorys, through: :category_sizes
  has_ancestry
end
