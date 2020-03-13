class PurchaseController < ApplicationController
  before_action :authenticate_user!
  before_action :set_card
  before_action :set_item

  require 'payjp'

  def index
    if @item.trading.status == false
      redirect_to root_path
    end
    if @card.blank?
      redirect_to new_card_path 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card = customer.cards.retrieve(@card.card_id)
      @image = @item.images.first
    end
  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    charge = Payjp::Charge.create(
    amount: @item.price,
    customer: @card.customer_id,
    currency: 'jpy',
    )
    @trading = @item.trading
    @trading.status = false
    @trading.save
  end

  def set_card
    @card = Card.where(user_id: current_user.id).first
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
