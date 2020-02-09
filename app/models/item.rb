class Item < ApplicationRecord
  def index
    @items = Itme.all
  end
end
