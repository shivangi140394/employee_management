class AddLeaveStatusToLeaveDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :leave_details, :leave_status_id, :integer
  end
end
