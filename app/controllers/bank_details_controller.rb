class BankDetailsController < ApplicationController

  def new
    @bank_detail = current_employee.build_bank_detail 
  end

  def create
    @bank_detail = current_employee.create_bank_detail(bank_details_params)
    redirect_to root_path
  end

  private
    def bank_details_params
      params.require(:bank_detail).permit(:account_no, :bank_name, :branch_name, :ifsc_code)
    end
end
