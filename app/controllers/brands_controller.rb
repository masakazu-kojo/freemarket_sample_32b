class BrandsController < ApplicationController
  def index
    @categorys_root = Category.order("id ASC").limit(13)
  end

end
