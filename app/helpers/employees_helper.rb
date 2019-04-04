module EmployeesHelper

  def employee_role id
    @role = Role.find_by_id(id)
    @role.name
  end 
  
  def employee_designation id
    @designation = Designation.find_by_id(id)
    @designation.name
  end 

end
