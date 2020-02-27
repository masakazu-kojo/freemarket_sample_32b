class Item < ApplicationRecord
  belongs_to :user
  belongs_to :brand, optional: true
  belongs_to :category
  has_one :trading
  has_many :images
  has_many :favorites
  has_many :purchaseds
end
