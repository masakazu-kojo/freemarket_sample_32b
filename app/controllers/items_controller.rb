class ItemsController < ApplicationController

  def index
    @items = Item.where(category1_id: 1).includes(:image)
  end
  
end
