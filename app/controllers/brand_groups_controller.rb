class BrandGroupsController < ApplicationController
  

  def index
    @category1s = Category.order("id").limit(13)
    @category1 = Category.find(params[:brand_id])
    @category3_ids = @category1.indirect_ids
    @items = category3_items_index(@category3_ids)
    @category_brands = category_brands(@items).sort { |a, b| a[:name] <=> b[:name] }
    @initials_index = initial_index(@items).sort { |a, b| a[:initial] <=> b[:initial] }
  end
  
  def show
    @brand = Brand.find(params[:id])
    @category1 = Category.find(params[:brand_id])
    @category3_ids = @category1.indirect_ids
    @items = category3_items_show(@category3_ids,params[:id])
    @items_category = items_category(@items).sort { |a, b| a[:name] <=> b[:name] }
  end
  
  def brand_category3
    @category3 = Category.find(params[:id])
    @brand = Brand.find(params[:brand_id])
    @items = Item.where(category_id: params[:id],brand_id: params[:brand_id])
  end
end
