class LeaveDetail < ApplicationRecord
  belongs_to :employee
  belongs_to :leave_type
  belongs_to :leave_status

  validates :absent_to, :absent_from, presence: true

  validates :avl_mobile,   :presence => {:message => 'hello world, bad operation!'},
                     :numericality => true,
                     :length => { :minimum => 10, :maximum => 15 }

  validates_format_of :avl_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  before_validation :absent_from_after_absent_to

  def leavedetail_role
    self.employee.role.name
  end

  def leavedetail_name
    self.employee.name
  end
  
  def leavedetail_designation
    self.employee.designation.name
  end


  private

  def absent_from_after_absent_to
    return if absent_from.blank? || absent_to.blank?

    if absent_from < absent_to
      errors.add(:absent_from, "must be after the start date")
    end
  end 
end
