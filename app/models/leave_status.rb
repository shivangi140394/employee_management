class LeaveStatus < ApplicationRecord 
  validates_uniqueness_of :name, dependent: :destroy
  belongs_to :leave_detail
end
