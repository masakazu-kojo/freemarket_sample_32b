class BrandsController < ApplicationController
  def index
    @categories_root = Category.order("id ASC").limit(13)
  end
  
  def show
    @brand = Brand.find(params[:id])
    @items = @brand.items
  end
end
