class ChangeIntegerToStringBankDetail < ActiveRecord::Migration[5.2]
  def change
    remove_column :bank_details, :ifsc_code 

   add_column :bank_details, :ifsc_code, :string
  end
end
