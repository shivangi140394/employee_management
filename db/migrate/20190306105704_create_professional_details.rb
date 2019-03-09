class CreateProfessionalDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :professional_details do |t|
      t.jsonb :acadmic_details, null: false, default: {}
      t.integer :total_experience
      t.timestamps
    end
  end
end
