module LeaveDetailsHelper

  def leave_status
    @leave_status = LeaveStatus.all
  end

  def current_employee_role_is_admin
    if current_employee.role.name == 'admin' 
      return true
    else
      return false
    end
  end

  def current_employee_role_is_hr
    if current_employee.role.name == 'hr'
      return true
    else
      return false
    end
  end

  def current_employee_role_is_lead
    if  current_employee.role.name == 'lead'  
      return true
    else
      return false
    end
  end

  def leave_status_name id
    @leavestatus = LeaveStatus.find_by_id(id)
    @leavestatus.name
  end  

  def leave_type
    LeaveType.order(:name)
  end
end
