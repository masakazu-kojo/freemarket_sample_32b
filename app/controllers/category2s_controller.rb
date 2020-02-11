class Category2sController < ApplicationController

  def show
    @category2 = Category2.find(params[:id])
    @category1 = @category2.category1
  end
end
