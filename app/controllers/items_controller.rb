class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update]

  def index
    @itemsPickCategory = Item.order("id DESC").limit(3)
    @imagePickCategory = {}
    @itemsPickCategory.each do |item|
      @imagePickCategory[:"#{item.id}"] = item.images.first
    end

    @itemsPickBrand = Item.order("id DESC").limit(3)
    @imagePickBrand = {}
    @itemsPickBrand.each do |item|
      @imagePickBrand[:"#{item.id}"] = item.images.first
    end
  end

  def new
    @item = Item.new
    @item.images.new
    @brand = Brand.new
    @categories_root = Category.order("id").limit(13)
    gon.image_count = @item.images.count
  end

  def edit
    @category = Category.find(@item.category_id)
    @category_parent = @category.parent
    @category_root = @category.root
    @brand = @item.brand
    @categories_root = @category.root.siblings
    @categories_parent = @category.parent.siblings
    @categories = @category.siblings
    if @item.size_id.present?
      @sizes = Size.find(@item.size_id).siblings
    end
    gon.image_count = @item.images.count
  end

  def create
    @brand = Brand.new(brand_params)
    unless @brand.save
      if @brand.name.present?
        @brand = Brand.find_by(name: @brand.name)
      end
    end
    @item = Item.new(item_params)
    if @item.save
      Trading.create(item_id: @item.id, user_id: current_user.id)
      redirect_to root_path, notice: "出品しました"
    else
      render :new, notice: "出品に失敗しました"
    end
  end

  def update
    @brand = Brand.new(brand_params)
    unless @brand.save
      if @brand.name.present?
        @brand = Brand.find_by(name: @brand.name)
      end
    end
    if @item.update(item_params)
      redirect_to root_path, notice: "編集しました"
    else
      render :edit, notice: "編集に失敗しました"
    end
  end
  
  #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
  def get_category_parent
    @categories_parent = Category.find(params[:category_root_id]).children
  end

  # 子カテゴリーが選択された後に動くアクション
  #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
  def get_category
    @categories = Category.find(params[:category_parent_id]).children
  end

  # 孫カテゴリーが選択された後に動くアクション
  def get_size
    @category_parent = Category.find(params[:category_id]).parent
    @sizes = @category_parent.sizes[0].children
  end

  def search
    @items = Item.all.order("id DESC")
    @itemImage = {}
    @items.each do |item|
      @itemImage[:"#{item.id}"] = item.images.first
    end
  end

  def show
    @item = Item.find(params[:id])
  end
  
  # 仮で削除アクション設置
  # def destroy
  #   @item = Item.find(params[:id])
  #   @item.destroy
  #   redirect_to root_path
  # end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def brand_params
    params.require(:brand).permit(:name)
  end
  def item_params
    params.require(:item).permit(:name, :category_id, :explanation, :price, :size_id, :condition, :sent_charge, :shipping_area, :days_to_ship, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id, brand_id: @brand.id)
  end
end