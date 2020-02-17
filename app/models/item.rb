class Item < ApplicationRecord
  belongs_to :user
  belongs_to :brand
  belongs_to :category
  has_many :images
  has_many :favorites
  has_many :tradings
  has_many :purchaseds
end
