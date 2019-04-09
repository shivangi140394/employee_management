class LeaveType < ApplicationRecord
  has_many :leave_details
  validates_uniqueness_of :name, dependent: :destroy
end
