class LeaveDetail < ApplicationRecord
  has_many :leave_type
  # belongs_to :employee
end
