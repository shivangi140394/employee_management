class LeaveDetailsController < ApplicationController

  def index
    @leavedetails = LeaveDetail.all
  end

  def show
   @leavedetail = LeaveDetail.find(params[:id]) 
  end

  def new
    @leavedetail = LeaveDetail.new
  end

  def create
    binding.pry
    @leavedetail = LeaveDetail.new(leavedetail_params)
    @leavedetail.save
    redirect_to @leavedetail 
  end

  private
  def leavedetail_params
    params[:leave_detail].permit(:employee_id, :leave_type_id, :leave_type, :leave_apply_for_days, :absent_to, :absent_from, :reason_of_leave, :work_affect, :avl_mobile, :avl_email, :status)
  end
end
