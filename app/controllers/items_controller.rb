class ItemsController < ApplicationController
  before_action :set_category, only: [:new, :create]

  def index
    @itemsPickCategory = Item.order("id DESC").limit(3)
    @itemsPickBrand = Item.order("id DESC").limit(3)
  end

  def new
    @item = Item.new
    @item.images.new
    @brand = Brand.new
    @category1 = Category.new
    @categorys = Category.all.order("id")
    @brands = Brand.all.order("id")
  end

  def get_category2
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category2s = Category.find("#{params[:category1_id]}").children
  end

 # 子カテゴリーが選択された後に動くアクション
  def get_category3
  #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category3s = Category.find("#{params[:category2_id]}").children
  end

  # def edit
  #   @item = Item.find(params[:id])
  #   @item.images.new
  #   @brand = @item.brand
  #   @category1 = @item.category
  #   @category1s = Category.order("id").limit(13)
  #   # @category2s = Category2.all.order("id")
  #   # @category3s = Category3.all.order("id")
  #   @brands = Brand.all.order("id")
  # end

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
      redirect_to root_path, notice: "出品しました"
    else
      render :new, notice: "出品に失敗しました"
    end

    Trading.create(item_id: @item.id, user_id: current_user.id)
    redirect_to new_item_path, notice: "出品しました"

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
    params.require(:item).permit(:name, :category_id, :explanation, :price, :size, :condition, :sent_charge, :shipping_area, :days_to_ship, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id, brand_id: @brand.id)
  end
end