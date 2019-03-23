class CreateLeaveTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :leave_types do |t|
      t.string :name

      t.timestamps
    end
  end
end