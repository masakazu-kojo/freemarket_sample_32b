class PurchaseController < ApplicationController
  
  require 'payjp'

  def index
    @card = Card.where(user_id: current_user.id).first
    if @card.blank?
      redirect_to new_card_path 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    @card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    charge = Payjp::Charge.create(
    amount: 10000,
    customer: @card.customer_id,
    currency: 'jpy',
    )
  end
end
