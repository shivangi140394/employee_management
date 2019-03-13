class ProfessionalDetail < ApplicationRecord
  belongs_to :employee
  has_many :images, as: :imageable
  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true
end
