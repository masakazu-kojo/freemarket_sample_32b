class CardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_card, except: [:new, :create]

  require 'payjp'

  def new
    @card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if @card.exists?
  end

  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.create(
      description: 'test',
      card: params["payjp-token"],
      metadata: {user_id: current_user.id}
      )
    @card = Card.new(
      user_id: current_user.id,
      customer_id: customer.id,
      card_id: customer.default_card
      )
    if @card.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def delete
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    @card.delete
    redirect_to new_card_path
  end

  def show
    if @card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card = customer.cards.retrieve(@card.card_id)
      @exp_month = @default_card.exp_month.to_s
      @exp_year = @default_card.exp_year.to_s.slice(2,3)
    end
  end

  def set_card
    @card = Card.where(user_id: current_user.id).first
  end
end
