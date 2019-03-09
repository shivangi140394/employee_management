class AddIdToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :role_id, :integer
    add_column :employees, :designation_id, :integer
  end
end
