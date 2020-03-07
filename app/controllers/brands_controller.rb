class BrandsController < ApplicationController
  def index
    @categories_root = Category.order("id ASC").limit(13)
  end

end
