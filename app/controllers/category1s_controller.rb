class Category1sController < ApplicationController

  def index
    @category1s = Category1.order("id ASC")
    @category2s = Category2.order("id ASC")
    @category3s = Category3.order("id ASC")
  end


end
