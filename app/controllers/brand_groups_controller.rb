class BrandGroupsController < ApplicationController

  def category_brands(items)
    brands = []
    items.each do |item|
      brands << {id: item.brand_id, brand_name: Brand.find(item.brand_id).brand_name}
    end
    brands.uniq!(&:first)
    return brands
  end

  def initial_index(items)
    initials = []
    items.each do |item|
      initials << {id: item.brand_id, initial: Brand.find(item.brand_id).brand_name.slice(0)}
    end
    initials.uniq!(&:first)
    return initials
  end
  
  def index
    @category1s = Category1.order("id ASC")
    @category1 = Category1.find(params[:brand_id])
    @items = Item.where(category1_id: params[:brand_id])
    @category_brands = category_brands(@items).sort { |a, b| a[:brand_name] <=> b[:brand_name] }
    @initials_index = initial_index(@items).sort { |a, b| a[:initial] <=> b[:initial] }
  end
end
