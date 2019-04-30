class LeaveDetailsController < ApplicationController
  
  def index
    if current_employee.role.name == 'admin' 
      @leavedetails = LeaveDetail.order("created_at DESC")
    elsif current_employee.role.name == 'hr' 
      @leavedetails = LeaveDetail.all.except(current_employee.leave_details).order("created_at DESC")
    elsif current_employee.role.name == 'lead' 
      @leavedetails = current_employee.leave_details.order("created_at DESC")
    else 
      @leavedetails = current_employee.leave_details.order("created_at DESC")
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
    if @leavedetail.save
      flash[:success] = "You have successfully apply for leave!"
      redirect_to root_path
    else
       flash[:error] = @leavedetail.errors.full_messages
       # flash[:error] = "Sorry!! Try again"
      render 'new'
    end
  end

  def show_traniee
    employee_ids = Employee.where(lead: current_employee).pluck(:id)
    @leavedetails = LeaveDetail.where(employee_id: employee_ids)
    render 'index'
  end

  def show_hr_leave
    @leavedetails = current_employee.leave_details.order("created_at DESC")
    render 'index'
  end

  # def update
  #   @leavedetail = LeaveDetail.all
  #   @leavedetail = LeaveDetail.find_by_id(params[:id])
  #   @leavedetail.update_attributes(leavedetail_params)
  # end

  def update_status
    @leave_detail = LeaveDetail.find_by_id(params[:leave_detail_id])
    @leave_detail.leave_status_id = params[:status_id]
    if @leave_detail.save
      redirect_to root_path
    else
      render 'new'
    end  
  end

  def destroy
    @leavedetail = LeaveDetail.find(params[:id])
    if @leavedetail.destroy
      redirect_to leave_details_path
    else
      render 'new'
    end
  end

  private
    def leavedetail_params
      params[:leave_detail].permit(:employee_id, :leave_status_id, :leave_type_id, :leave_type, :leave_apply_for_days, :applied_date, :absent_to, :absent_from, :reason_of_leave, :work_affect, :avl_mobile, :avl_email, :current_status)
    end
end
