class LeaveDetail < ApplicationRecord
  # has_many :leave_type
  belongs_to :employee
  belongs_to :leave_type
  belongs_to :leave_status
end
