class LeaveDetail < ApplicationRecord
  belongs_to :employee
  belongs_to :leave_type
  belongs_to :leave_status
end
