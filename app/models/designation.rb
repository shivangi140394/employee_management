class Designation < ApplicationRecord
  validates_uniqueness_of :name, dependent: :destroy
end
