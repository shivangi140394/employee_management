class LeaveDetail < ApplicationRecord
  belongs_to :employee
  # has_one :leave_status
  # has_one :leave_type
  belongs_to :leave_status
  belongs_to :leave_type
  
  validates :absent_to, :absent_from, :leave_apply_for_days, presence: true

  validates :avl_mobile,   :presence => {:message => 'hello world, bad operation!'},
                     :numericality => true,
                     :length => { :minimum => 10, :maximum => 15 }

  validates_format_of :avl_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  # scope :all_except, ->(leave_detail) { where.not(id: leave_detail) }
  scope :all_except, ->(employee) { where.not(id: employee) }

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
    if leave_apply_for_days < (absent_from - absent_to).to_i
      errors.add(:absent_to, "Apply leave days is greater than leave apply for the days")

    elsif absent_from < absent_to
      errors.add(:absent_from, "must be after the start date")
   

    elsif absent_to.present? && absent_to < Date.today
      errors.add(:absent_to, "Date can't be in the past")
    

    elsif absent_from.present? && absent_from < Date.today
      errors.add(:absent_from, "can't be in the past")
    end
  end
end
