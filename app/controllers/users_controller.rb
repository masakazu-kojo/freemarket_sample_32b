class UsersController < ApplicationController
  before_action :set_items, only: [:index, :listings_purchased]
  before_action :set_purchase, only: [:index, :purchase, :purchased]
  before_action :set_address
  
  

  def index
    @items = @purchases.map {|purchase| purchase.item }
  end
  
  def like
    @favorites = Favorite.where(user_id: current_user.id)
  end

  #出品した商品-出品中
  def listings_listing
    @tradings = Trading.where(status: true, user_id: current_user.id)
    @items = @tradings.map {|trading| trading.item }
  end

  #出品した商品-取引中
  def listings_in_progress
    @tradings = Trading.where(status: false, user_id: current_user.id)
    @items = @tradings.map {|trading| trading.item }
  end

  #出品した商品-売却済み
  def listings_purchased
    @items = @current_user_items.map {|item| item.purchase }
  end

  #購入した商品-取引中(現状過去の取引と同じ、今後実装次第で変更するので仮置き)
  # def purchase
  # end

  #購入した商品-過去の取引(今後実装次第で変更するので仮置き)
  # def purchased
  # end
  
  private

  def set_items
    @current_user_items = Item.where(user_id: current_user.id)
  end

  def set_purchase
    @purchases = Purchase.where(user_id: current_user.id)
    @items = @purchases.map {|purchase| purchase.item }
  end

  def set_address
    @address = User.find(current_user.id).address
  end


end
