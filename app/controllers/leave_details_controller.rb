class LeaveDetailsController < ApplicationController
  
  def index
    if current_employee.role.name == 'Admin' || 'HR'
      @leavedetails = LeaveDetail.order(:reason_of_leave)
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
    @leavedetail = current_employee.leave_details.create(leavedetail_params)
    @leavedetail.save
    redirect_to root_path
  end

  def update
    @leavedetail = LeaveDetail.all
    @leavedetail = LeaveDetail.find_by_id(params[:id])
    @leavedetail.update_attributes(leavedetail_params)
  end

  def update_status
    @leave_detail = LeaveDetail.find_by_id(params[:leave_detail_id])
    @leave_detail.leave_status_id = params[:status_id]
    @leave_detail.save   
  end

  def destroy
    @leavedetail = LeaveDetail.find(params[:id])
    @leavedetail.destroy
    redirect_to root_path
  end

  private
    def leavedetail_params
      params[:leave_detail].permit(:employee_id, :leave_status_id, :leave_type_id, :leave_type, :leave_apply_for_days, :absent_to, :absent_from, :reason_of_leave, :work_affect, :avl_mobile, :avl_email, :current_status)
    end
end
