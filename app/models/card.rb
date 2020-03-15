class Card < ApplicationRecord
  validates :customer_id, presence: true
  validates :card_id, presence: true
end
