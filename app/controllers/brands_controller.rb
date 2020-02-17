class BrandsController < ApplicationController
  def index
    @category1s = Category.order("id ASC").limit(13)
  end

end
