class Home < ApplicationRecord
  belongs_to :employee, optional: true
  mount_uploader :image, ImageUploader
end
