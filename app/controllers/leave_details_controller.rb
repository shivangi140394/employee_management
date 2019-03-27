class LeaveDetailsController < ApplicationController

  def index
    @leavedetails = LeaveDetail.all
     if current_employee.role_id == 52 
      @leavedetails = LeaveDetail.all
     else
      @leavedetails = current_employee.leave_details
     end
  end

  def show
   @leavedetail =LeaveDetail.find(params[:id])
  end

  def new
    @leavedetail = current_employee.leave_details.new 
  end

  def create
    binding.pry
    @leavedetail = current_employee.leave_details.create(leavedetail_params)
    @leavedetail.save
    redirect_to @leavedetail 
  end

  # def update
  #   @leavedetail = leavedetail.update(leavedetail_params)
  #   if @leavedetail.save
  #     flash[:success] = 'Activity successfully updated!'
  #     redirect_to root_path
  #   else
  #     flash[:error] = 'ERROR: Activity failed to update'
  #     render_to_string
  #   end
  # end

  def destroy
    @leavedetail = LeaveDetail.find(params[:id])
    @leavedetail.destroy
 
    redirect_to @leavedetail 
  end

  # def send_email
  #   @leavedetail = LeaveDetail.find(params[:id])
  #   EmployeeMailer.welcome_email(@leavedetail, params[:email]).deliver_now
  #   redirect_to root_path
  # end

  private
  def leavedetail_params
    params[:leave_detail].permit(:employee_id, :leave_status_id, :leave_type_id, :leave_type, :leave_apply_for_days, :absent_to, :absent_from, :reason_of_leave, :work_affect, :avl_mobile, :avl_email, :current_status)
  end
end
