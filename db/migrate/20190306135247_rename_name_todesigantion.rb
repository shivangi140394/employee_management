class RenameNameTodesigantion < ActiveRecord::Migration[5.2]
  def change
    rename_column :designations , :Name, :name
  end
end
