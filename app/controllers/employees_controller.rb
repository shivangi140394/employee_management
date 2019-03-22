class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end
  
  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
    # @bd = @employee.build_bank_detail
  end

  def create
    # binding.pry
    @employee = Employee.create(new_employee_params)
    # redirect_to root_path 
    unless @employee.save
     render 'new'
    end 
  end

  def edit
    @employee = Employee.find_by(id: params[:id])
    @bank_detail = BankDetail.find_by_id(@employee_id)
  end

  def update
    binding.pry
    @employee = Employee.find(params[:id])
    @bank_detail = BankDetail.find(params[:id])
    redirect_to root_path
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to root_path
  end

  def send_email
    @employee = Employee.find(params[:id])
    EmployeeMailer.welcome_email(@employee, params[:email]).deliver_now
    redirect_to root_path
  end

  private

    def new_employee_params
      params.require(:employee).permit(:role_id, :designation_id, :email, :password, :password_confirmation, :name, :phone, bank_detail_attributes: [:account_no, :bank_name, :branch_name, :ifsc_code], professional_detail_attributes: [:name, :total_experience, :images_attributes=> [:name]], address_attributes: [:house_no, :street, :local_address, :parmanent_address, :city, :state, :pincode])
    end

    # def method_name
      
    # end
end
