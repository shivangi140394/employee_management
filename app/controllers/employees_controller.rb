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
    #   redirect_to root_path
    # else
      render 'new'
    end 
  end

  def edit 
    @employee = Employee.find_by(id: params[:id])
    @bank_detail = @employee.build_bank_detail
    # @professional_detail = @employee.build_professional_detail
    @address = @employee.addresses.new
  end

  def update
    @employee = Employee.find(params[:id])
    # @employee.update(new_employee_params)
    @bank_detail = @employee.create_bank_detail(bank_detail_params)
    # @professional_detail = @employee.create_professional_detail(professional_detail_attributes_params)
    # @professional_detail.images.create(professional_detail_params)
    @address = @employee.addresses.create(address_params)
    if @employee.update(new_employee_params) 
      flash[:success] = "You have successfully apply for leave!" 
      redirect_to @employee
    else
      flash[:error] = @employee.errors.full_messages
      render 'edit'
    end 
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
      params.require(:employee).permit(:role_id, :designation_id, :email, :password, :password_confirmation, :name, :phone, :lead, bank_details_attributes:
     [:account_no, :bank_name, :branch_name, :ifsc_code], addresses_attributes: [:house_no, :street, :local_address, :permanent_address, :city, :state, :pincode])
    end
    def bank_detail_params
      params[:employee][:bank_detail_attributes].permit(:account_no, :bank_name, :branch_name, :ifsc_code)
    end

    # # def professional_detail_params
    # #   params[:employee][:professional_detail][:images][:name].permit(:name)
    # # end

    # # def professional_detail_attributes_params
    # #   params[:employee][:professional_detail_attributes].permit(:name, :total_experience)
    # # end

    def address_params
      params[:employee][:address].permit(:house_no, :street, :local_address, :permanent_address, :city, :state, :pincode)
    end
end
