class ChangecolstringToBooleanLeavedetail < ActiveRecord::Migration[5.2]
  def change
   remove_column :leave_details, :status 

   add_column :leave_details, :current_status, :boolean, default: false
  end
end
