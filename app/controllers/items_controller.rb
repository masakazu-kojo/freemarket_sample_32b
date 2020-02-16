class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @brand = Brand.new
    @category1 = Category1.new
    @category2 = Category2.new
    @category3 = Category3.new
    @category1s = Category1.all.order("id")
    # @category2s = Category2.all.order("id")
    # @category3s = Category3.all.order("id")
    @brands = Brand.all.order("id")
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      @item = Item.new(item_params)
    else
      b_id = Brand.find_by(brand_name: @brand.brand_name).id
      @item = Item.new(item_params)
      @item["brand_id"] = b_id
      
    end
    @item.save
    redirect_to new_item_path, notice: "出品しました"
  end
  
  private
  def brand_params
    params.require(:brand).permit(:brand_name)
  end
  def item_params
    params.require(:item).permit(:item_name,:brand_name,:category1_id,:explanation,:price,:condition,:sent_charge,:shipping_area,:days_to_ship).merge(user_id: current_user.id, brand_id: @brand.id)
  end
