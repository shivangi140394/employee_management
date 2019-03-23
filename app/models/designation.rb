class Designation < ApplicationRecord
  # has_one :employee
  validates_uniqueness_of :name, dependent: :destroy
end
