class AddressesController < ApplicationController
    
  def show
    @address = current_employee.address
  end

  def new
    @address = current_employee.build_address
  end

  def create
    @address = current_employee.create_address(address_params)
    redirect_to root_path
  end

  def edit
    @address = current_employee.build_address
  end

  def update
    @address = current_employee.create_address(address_params)
  end

  private
    def address_params
      params.require(:address).permit(:house_no, :street, :local_address, :permanent_address, :city, :state, :pincode)
    end
end
