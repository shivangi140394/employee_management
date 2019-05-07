class BankDetailsController < ApplicationController

  def show
    @bank_detail = current_employee.bank_detail
  end

  def new
    @bank_detail = current_employee.build_bank_detail 
  end

  def create
    @bank_detail = current_employee.create_bank_detail(bank_details_params)
    redirect_to root_path
  end

  def edit
    @bank_detail = current_employee.build_bank_detail
  end

  def update
     @bank_detail = current_employee.create_bank_detail(bank_details_params)
  end


  private
    def bank_details_params
      params.require(:bank_detail).permit(:account_no, :bank_name, :branch_name, :ifsc_code)
    end
end


