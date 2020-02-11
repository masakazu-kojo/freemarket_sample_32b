class Item < ApplicationRecord

  # belongs_to :category1
  # belongs_to :category2
  # belongs_to :category3
  def index
    @items = Itme.all
  end
end
