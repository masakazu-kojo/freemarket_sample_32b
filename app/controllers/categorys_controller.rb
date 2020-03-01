class CategorysController < ApplicationController

  def index
    @categorys = Category.order("id ASC")
    @category1s = @categorys.limit(13)
    
  end
  


  def show
    @category = Category.find(params[:id])
    @items = selected_category_items(@category)
    @items_brand = category_brands(@items).sort { |a, b| a[:name] <=> b[:name] }
  end


end
