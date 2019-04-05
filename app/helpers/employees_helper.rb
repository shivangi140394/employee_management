module EmployeesHelper

  def employee_role id
    @role = Role.find_by_id(id)
    @role.name
  end 
  
  def employee_designation id
    @designation = Designation.find_by_id(id)
    @designation.name
  end 

  # def current_employee_role_is_admin
  #   binding.pry
  #   if current_employee.role.name == ('Admin' || 'HR')
  #     return true
  #   else
  #     return false
  #   end
  # end

end
