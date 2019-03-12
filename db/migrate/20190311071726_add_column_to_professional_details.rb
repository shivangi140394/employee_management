class AddColumnToProfessionalDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :professional_details, :name, :string
  end
end
