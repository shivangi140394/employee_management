class RenameDatatypeToLeaveDetail < ActiveRecord::Migration[5.2]
  def change
    remove_column :leave_details, :avl_mob 
    remove_column :leave_details, :absence_duration_to
    remove_column :leave_details, :absence_duration_from
    
    add_column :leave_details, :avl_mobile, :string
    add_column :leave_details, :absent_to, :datetime
    add_column :leave_details, :absent_from, :datetime 
  end
end
