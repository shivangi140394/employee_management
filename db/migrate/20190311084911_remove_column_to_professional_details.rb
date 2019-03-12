class RemoveColumnToProfessionalDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :professional_details, :acadmic_details, :jsonb
  end
end
