class AddressesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @address = Address.new
  end
  
  def create
    # binding.pry
    @address = Address.new(address_params)
    if @address.save
      redirect_to users_path
    end
  end

  private
  def address_params
    params.require(:address).permit(:user_id, :send_familyname, :send_firstname, :send_familyname_kana, :send_firstname_kana, :postal_code, :prefecture, :municipality, :house_number, :building_name, :phone_number)
  end

end