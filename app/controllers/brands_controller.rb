class BrandsController < ApplicationController
  def index
    @category1s = Category1.order("id ASC")
  end
end
