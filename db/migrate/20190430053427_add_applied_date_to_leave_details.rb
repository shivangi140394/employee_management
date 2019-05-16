class AddAppliedDateToLeaveDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :leave_details, :applied_date, :date 
  end
end
