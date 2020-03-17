class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @images = Image.all
    @items = Item.all
    @itemsPickBrand = Item.order("id DESC").limit(3)
    @itemsPickCategory = Item.order("id DESC").limit(3)
  end
end
