class RenameDateTimeToLeaveDetail < ActiveRecord::Migration[5.2]
  def change
   change_column :leave_details , :absent_to, :date
   change_column :leave_details , :absent_from, :date
  end
end
