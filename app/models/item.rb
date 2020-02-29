class Item < ApplicationRecord
  has_one :trading, dependent: :destroy
  belongs_to :user
  belongs_to :brand, optional: true
  belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :favorites
  has_many :purchaseds
end
