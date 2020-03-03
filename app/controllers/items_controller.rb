class ItemsController < ApplicationController
  before_action :set_category, only: [:new, :create]

  def index
    @itemsPickCategory = Item.order("id DESC").limit(3)
    @itemsPickBrand = Item.order("id DESC").limit(3)
  end

  def new
    @items = Item.order("id DESC").limit(3)
    @item = Item.new
    @item.images.new
    @brand = Brand.new
    @categorys = Category.all.order("id")
  end

  def edit
    @item = Item.find(params[:id])
    @category3 = Category.find(@item.category_id)
    @category2 = @category3.parent
    @category1 = @category3.root
    # @item.images.new
    @brand = @item.brand
    @category1s = @category3.root.siblings
    @category2s = @category3.parent.siblings
    @category3s = @category3.siblings
    @sizes = Size.find(@item.size_id).siblings
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      @item = Item.new(item_params)
    elsif @brand.name.present?
      b_id = Brand.find_by(name: @brand.name).id
      @item = Item.new(item_params)
      @item["brand_id"] = b_id
    else
      @item = Item.new(item_params)
    end
    if @item.save
      Trading.create(item_id: @item.id, user_id: current_user.id)
      redirect_to new_item_path, notice: "出品しました"
    else
      render :new, notice: "出品に失敗しました"
    end
  end

  def update
    if @item.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
  def get_category2
    @category2s = Category.find("#{params[:category1_id]}").children
  end

  # 子カテゴリーが選択された後に動くアクション
  #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
  def get_category3
    @category3s = Category.find("#{params[:category2_id]}").children
  end

  # 孫カテゴリーが選択された後に動くアクション
  def get_size
    @category2 = Category.find("#{params[:category3_id]}").parent
    @sizes = @category2.sizes[0].children
  end

  def search
    @items = Item.all.order("id DESC")
  end

  def show
  end

  private

  def set_category
    @category1s = Category.order("id").limit(13)
  end
  def brand_params
    params.require(:brand).permit(:name)
  end
  def item_params
    params.require(:item).permit(:name, :category_id, :explanation, :price, :size_id, :condition, :sent_charge, :shipping_area, :days_to_ship, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id, brand_id: @brand.id)
  end
end