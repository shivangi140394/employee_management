class EmployeesController < ApplicationController
  before_action :authenticate_employee!

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
    password_length = 6
    password = Devise.friendly_token.first(password_length)
    @employee = Employee.new(new_employee_params)
    @employee.personal_password = password
    @employee.password = password
    # @employee = Employee.create(new_employee_params)
    # @employee.password = SecureRandom.hex(8)
    unless @employee.save
      flash[:error] = @employee.errors.full_messages
      render 'new'
    else
      flash[:success] = "Thanks to create a new user!" 
      redirect_to root_path
    end 
  end

  def edit
    @employee = Employee.find_by(id: params[:id])
    # @bank_detail = @employee.build_bank_detail
    # @address = @employee.build_address
  
  end

  def update_password
    @employee = current_employee
    if @employee.update_with_password(new_employee_params)
      bypass_sign_in @employee, scope: :employee
      redirect_to root_path
    else
      render "edit"
    end
  end

  def update
    @employee = Employee.find(params[:id])
    # @employee.update(new_employee_params)
    # @bank_detail = @employee.create_bank_detail(bank_detail_params)
    # @professional_detail = @employee.create_professional_detail(professional_detail_attributes_params)
    # @professional_detail.images.create(professional_detail_params)
    # @address = @employee.addresses.create(address_params)
    # @address = @employee.create_address(address_params)
    if @employee.update(new_employee_params) 
      flash[:success] = "You have successfully update your profile!" 
      redirect_to root_path
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

  private

   
    def new_employee_params
      params.require(:employee).permit(:role_id, :designation_id, :email, :personal_email, :personal_password, :password, :password_confirmation, :name, :phone, :lead, bank_detail_attributes:
     [:account_no, :bank_name, :branch_name, :ifsc_code], address_attributes: [:house_no, :street, :local_address, :permanent_address, :city, :state, :pincode])
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
      params[:employee][:address_attributes].permit(:house_no, :street, :local_address, :permanent_address, :city, :state, :pincode)
    end
end
