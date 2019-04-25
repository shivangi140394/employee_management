module EmployeesHelper

  def employee_role id
    @role = Role.find_by_id(id)
    @role.name
  end 
  
  def employee_designation id
    @designation = Designation.find_by_id(id)
    @designation.name
  end

  def employee_lead lead_id
    @lead_employee = Employee.find_by_id(lead_id)
    if @lead_employee.present?
      @lead_employee.name
    end
  end

  def lead_list
    role_ids = Role.where(name: ["lead", "admin", "employee"]).pluck(:id)
    @employee = Employee.where(role_id: role_ids)  

  end

  def designation_list
    Designation.order(:name)
  end

  def role_list
    Role.order(:name)
  end
end
