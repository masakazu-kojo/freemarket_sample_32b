class UsersController < ApplicationController
  before_action :set_items, only: [:index, :listings_purchased]
  before_action :set_trading, only: [:listings_listing, :listings_in_progress]
  before_action :set_purchase, only: [:purchase, :purchased]
  
  def index
    @purchases = Purchase.where(user_id: current_user.id)
    @items = listing_items(@purchases)
  end
  
  def like
    @favorites = Favorite.where(user_id: current_user.id)
  end
  
  def listings_listing
    @items = listing_items(@tradings)
  end

  def listings_in_progress
    @items = listing_items(@tradings)
  end

  def listings_purchased
    @items = purchased_listing_items(@current_user_items)
  end

  def purchase
    @items = listing_purchased_items(@purchases)
  end

  def purchased
    @items = listing_items(@purchases)
  end
  
  private

  def set_items
    @current_user_items = Item.where(user_id: current_user.id)
  end

  def set_trading
    @tradings = Trading.where(status: true, user_id: current_user.id)
  end

  def set_purchase
    @purchases = Purchase.where(user_id: current_user.id)
  end
end
