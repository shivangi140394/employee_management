class CreateLeaveDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :leave_details do |t|
      t.string :leave_type
      t.integer :leave_apply_for_days
      t.string :absence_duration_to
      t.string :absence_duration_from
      t.string :reason_of_leave
      t.string :work_affect
      t.integer :avl_mob
      t.string :avl_email
      t.string :status

      t.timestamps
    end
  end
end
