class BrandGroupsController < ApplicationController

  def category_brands(items)
    brands = []
    items.each do |item|
      if item.brand_id.present?
        brands << {id: item.brand_id, name: Brand.find(item.brand_id).name}
      end
    end
    brands.uniq!(&:first)
    return brands
  end

  def initial_index(items)
    initials = []
    items.each do |item|
      if item.brand_id.present?
        initials << {initial: Brand.find(item.brand_id).name.slice(0),id: item.brand_id }
      end
    end
    initials.uniq!(&:first)
    return initials
  end
  
  def index
    @category1s = Category.order("id").limit(13)
    @category1 = Category.find(params[:brand_id])
    @items = Item.where(category_id: params[:brand_id])
    @category_brands = category_brands(@items).sort { |a, b| a[:name] <=> b[:name] }
    @initials_index = initial_index(@items).sort { |a, b| a[:initial] <=> b[:initial] }
  end

  def show
    @category1 = Category.find(params[:brand_id])
    @brand = Brand.find(params[:id])
    @items = Item.where(category_id: params[:brand_id],brand_id: params[:id])
  end
end
