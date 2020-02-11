class Category3sController < ApplicationController
  def show
    @category3 = Category3.find(params[:id])
    @category2 = @category3.category2
    @category1 = @category2.category1
  end
end
