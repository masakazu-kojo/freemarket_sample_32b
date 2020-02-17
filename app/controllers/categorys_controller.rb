class CategorysController < ApplicationController

  def index
    @categorys = Category.order("id ASC")
    @category1s = @categorys.limit(13)
    
  end

  def show
    @category = Category.find(params[:id])
    @items = Item.where(category_id: params[:id])
  end


end
