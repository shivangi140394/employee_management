class CreateDesignations < ActiveRecord::Migration[5.2]
  def change
    create_table :designations do |t|
      t.string :Name

      t.timestamps
    end
  end
end
