module EmployeesHelper

  def employee_role id
    @role = Role.find_by_id(id)
    @role.name
  end 
  
  def employee_designation id
    @designation = Designation.find_by_id(id)
    @designation.name
  end

  def lead_list
    role_ids = Role.where(name: ["Lead", "Admin"]).pluck(:id)
    Employee.where(role_id: role_ids)
  end
end
