class Image < ApplicationRecord
  require 'carrierwave/orm/activerecord'
  
  belongs_to :imageable, polymorphic: true
  mount_uploader :name, ProfessionalDetailUploader

end

