class AddressesController < ApplicationController
  def new
    @address = current_employee.addresses.new 
  end

  def create
    @address = current_employee.addresses.create(address_params)
    redirect_to root_path
  end

  private
  def address_params
    params.require(:address).permit(:house_no, :street, :local_address, :parmanent_address, :city, :state, :pincode)
  end
end
