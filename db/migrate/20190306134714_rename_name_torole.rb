class RenameNameTorole < ActiveRecord::Migration[5.2]
  def change
    rename_column :roles , :Name, :name
  end
end
