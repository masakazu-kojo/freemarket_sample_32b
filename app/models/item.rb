class Item < ApplicationRecord

  validates :name, :explanation, :price, :condition, :sent_charge, :shipping_area, :days_to_ship, :user_id, :category_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 999999}
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :trading, dependent: :destroy
  has_one :purchase, dependent: :destroy
  belongs_to :user
  belongs_to :brand, optional: true
  belongs_to :category
  belongs_to :size, optional: true
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :purchaseds
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :itemcondition
  belongs_to_active_hash :itemsentcharge

  def previous
    Item.where("id < ?", self.id).order("id DESC").first
  end

  def next
    Item.where("id > ?", self.id).order("id ASC").first
  end
  
end
