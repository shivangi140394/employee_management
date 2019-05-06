class LeaveType < ApplicationRecord
  belongs_to :leave_detail
  validates_uniqueness_of :name, dependent: :destroy
end
