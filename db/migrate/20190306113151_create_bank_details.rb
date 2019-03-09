class CreateBankDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :bank_details do |t|
      t.string :account_no
      t.string :bank_name
      t.string :branch_name
      t.integer :ifsc_code
      t.timestamps
    end
  end
end
