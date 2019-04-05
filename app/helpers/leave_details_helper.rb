module LeaveDetailsHelper

  def leave_status
    @leave_status = LeaveStatus.all
  end

  def current_employee_role_is_admin
    if current_employee.role.name == ('Admin' || 'HR')
      return true
    else
      return false
    end
  end

  def current_employee_role_is_lead
    if  current_employee.role.name == 'Lead' 
      return true
    else
      return false
    end
  end

  def leave_status_name id
    @leavestatus = LeaveStatus.find_by_id(id)
    @leavestatus.name
  end  
end
