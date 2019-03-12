class RemoveColumnToImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :image_type, :string
  end
end
