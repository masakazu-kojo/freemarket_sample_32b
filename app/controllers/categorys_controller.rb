class CategorysController < ApplicationController

  def index
    @category1s = Category.order("id ASC").limit(13)
    @category2s = Category.order("id ASC")
    @category3s = Category.order("id ASC")
  end

  def show
    @category1 = Category.find(params[:id])
    @items = Item.where(category1_id: params[:id])
  end


end
