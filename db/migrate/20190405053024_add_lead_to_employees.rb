class AddLeadToEmployees < ActiveRecord::Migration[5.2]
  def change
     add_column :employees, :lead, :string
  end
end
