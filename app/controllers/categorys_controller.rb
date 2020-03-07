class CategorysController < ApplicationController

  before_action :set_category, only: [:show]

  def index
    @categorys = Category.order("id ASC")
    @categorys_root = @categorys.limit(13)
    
  end
  
  def show
    @items = selected_category_items(@category)
    @items_brand = category_brands(@items).sort { |a, b| a[:name] <=> b[:name] }
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

end
