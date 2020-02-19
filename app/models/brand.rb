class Brand < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, presence: true
  has_many :items 
end
