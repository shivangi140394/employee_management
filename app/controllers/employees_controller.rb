class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end
  
  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.create(new_employee_params)
    unless @employee.save
      render 'new'
    end 
  end

  def edit
    @employee = Employee.find(params[:id])
    @bt = @employee.build_bank_detail
    @pd = @employee.build_professional_detail
    @address = @employee.addresses.new
    @image =  @pd.images.new
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
      params.require(:employee).permit(:role_id, :designation_id, :email, :password, :password_confirmation, :name, :phone)
    end
end