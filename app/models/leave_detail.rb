class LeaveDetail < ApplicationRecord
  belongs_to :employee
  belongs_to :leave_type
  belongs_to :leave_status

  # validates :absent_to, :absent_from, presence: true
  # before_create :absent_from_after_absent_to

  # private

  # def absent_from_after_absent_to
  # binding.pry
  #   return if absent_from.blank? || absent_to.blank?

  #   if absent_from < absent_to
  #     errors.add(:absent_from, "must be after the start date")
  #   end
  # end 

  # validates :reason_of_leave, presence: true

  def leavedetail_name
    self.employee.role.name
  end

  def leavedetail_role
    self.employee.name
  end
end
