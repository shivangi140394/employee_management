class AddEmployeIdToAllTable < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :employee_id, :integer
    add_column :professional_details, :employee_id, :integer
    add_column :bank_details, :employee_id, :integer
  end
end
