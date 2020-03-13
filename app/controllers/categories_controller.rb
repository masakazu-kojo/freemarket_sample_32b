class CategoriesController < ApplicationController

  before_action :set_category, only: [:show]

  def index
    @categories = Category.order("id ASC")
    @categories_root = @categories.limit(13)
    
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
