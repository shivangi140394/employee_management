class AddLeaveTypeIdToLeaveDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :leave_details, :leave_type_id, :integer
  end
end
