class Brand < ApplicationRecord
  validates :brand_name, uniqueness: true

  has_many :items 
end
