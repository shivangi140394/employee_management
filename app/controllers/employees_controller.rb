class EmployeesController < ApplicationController
  load_and_authorize_resource 
  skip_load_and_authorize_resource only: :create

  def index
    @employees = Employee.all
  end
  
  def show
    if current_employee.admin? || current_employee.hr? || current_employee.id == params[:id].to_i
      @employee = Employee.find(params[:id])
    else
      @employee = current_employee
      flash[:danger] = "You are not authorize to access this page"
    end
  end

  def new
    @employee = Employee.new
  end

  def create
    password_length = 6
    password = Devise.friendly_token.first(password_length)
    @employee = Employee.new(allowed_params)
    @employee.personal_password = password
    @employee.password = password
    # @employee = Employee.create(new_employee_params)
    # @employee.password = SecureRandom.hex(8)
    unless @employee.save
      flash[:danger] = @employee.errors.full_messages
      render 'new'
    else
      flash[:success] = "Thanks to create a new user!" 
      redirect_to root_path
    end 
  end

  def edit
  end

  def update
    # @employee = Employee.find(params[:id])
    # @professional_detail = @employee.create_professional_detail(professional_detail_attributes_params)
    # @professional_detail.images.create(professional_detail_params)
    if current_employee.update_with_password(allowed_params)
      bypass_sign_in current_employee
      flash[:notice] = 'Password updated.'
      redirect_to root_path
    else
      flash[:danger] = current_employee.errors.full_messages
      render 'edit'
    end 
  end

  def destroy
    @employee = Employee.find(params[:id])
    current_employee.destroy
    redirect_to root_path
  end

  private

   
    def allowed_params
      params.require(:employee).permit(:role_id, :designation_id, :email, :personal_email, :personal_password, :password, :password_confirmation, :current_password, :name, :phone, :lead)
    end
    
    # def new_employee_params
    #   params.require(:employee).permit(:role_id, :designation_id, :email, :personal_email, :personal_password, :password, :password_confirmation, :current_password, :name, :phone, :lead, bank_detail_attributes:
    #  [:account_no, :bank_name, :branch_name, :ifsc_code], address_attributes: [:house_no, :street, :local_address, :permanent_address, :city, :state, :pincode])
    # end
    # def bank_detail_params
    #   params[:employee][:bank_detail_attributes].permit(:account_no, :bank_name, :branch_name, :ifsc_code)
    # end

    # # def professional_detail_params
    # #   params[:employee][:professional_detail][:images][:name].permit(:name)
    # # end

    # # def professional_detail_attributes_params
    # #   params[:employee][:professional_detail_attributes].permit(:name, :total_experience)
    # # end

    # def address_params
    #   params[:employee][:address_attributes].permit(:house_no, :street, :local_address, :permanent_address, :city, :state, :pincode)
    # end
end
