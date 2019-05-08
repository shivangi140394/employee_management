# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(employee)
    employee ||= Employee.new # guest user (not logged in)
    if employee.lead?
      can [:show], Employee
      can [:show_traniee], :all
      can [:create, :read], LeaveDetail
    elsif employee.admin?
      can :manage, :all
    elsif employee.employee?
      can [:update, :show], Employee
      can [:create, :edit], Address
      can [:create, :edit], BankDetail
      can [:create, :read], LeaveDetail
    elsif employee.hr?
      can [:manage, :create], :all
      can [:show_hr_leave], LeaveDetail
    else
      cannot :manage, :all
    end
  end
end
