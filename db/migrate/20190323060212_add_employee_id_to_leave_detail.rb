class AddEmployeeIdToLeaveDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :leave_details, :employee_id, :integer
  end
end
