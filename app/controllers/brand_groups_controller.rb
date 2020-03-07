class BrandGroupsController < ApplicationController
  

  def index
    @categorys_root = Category.order("id").limit(13)
    @category_root = Category.find(params[:brand_id])
    @category_ids = @category_root.indirect_ids
    @items = category_items_index(@category_ids)
    @category_brands = category_brands(@items).sort { |a, b| a[:name] <=> b[:name] }
    @initials_index = initial_index(@items).sort { |a, b| a[:initial] <=> b[:initial] }
  end
  
  def show
    @brand = Brand.find(params[:id])
    @category_root = Category.find(params[:brand_id])
    @category_ids = @category_root.indirect_ids
    @items = category_items_show(@category_ids,params[:id])
    @items_category = items_category(@items).sort { |a, b| a[:name] <=> b[:name] }
  end
  
  def brand_category
    @category = Category.find(params[:id])
    @brand = Brand.find(params[:brand_id])
    @items = Item.where(category_id: params[:id],brand_id: params[:brand_id])
  end
end
