class EmployeesController < ApplicationController

  def new
    @employee = Employee.new
  end

  def create
    binding.pry
    @employee = Employee.create(new_employee_params)
    redirect_to root_path
  end

  private
  def new_employee_params
    params.require(:employee).permit(:role, :designation, :email, :password, :password_confirmation)
  end
end
