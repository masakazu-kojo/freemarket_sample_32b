class Item < ApplicationRecord
  has_one :trading, dependent: :destroy
  belongs_to :user
  belongs_to :brand, optional: true
  belongs_to :category
  has_many :images
  has_many :favorites
  has_many :purchaseds
end
