class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :house_no
      t.string :street
      t.string :local_address
      t.string :permanent_address
      t.string :city
      t.string :state
      t.integer :pincode

      t.timestamps
    end
  end
end
