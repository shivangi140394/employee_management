# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(employee)
    # can :update, :create, Employee, if employee.role == "employee"
    # can :show, :show_traniee, Employee, if employee.role == "lead"
    # can :create, :show, :destroy, :edit, Employee, if employee.role == "admin"
    # can :create, :edit, Employee, if employee.role == "hr"
    employee ||= Employee.new # guest user (not logged in)
    # if employee.admin?
    #   can :manage, :all

    # elsif employee.hr?
    #   can :manage, :all

    # elsif employee.lead?
    #   can :manage, :all

    # elsif employee.employee?
      can :manage, :all if employee.admin?
      can :update, Employee
      can :create, LeaveDetail if employee.employee?
      can :create, Address
      can :create, BankDetail
      can :edit, Address
      can :edit, BankDetail
      can :read, LeaveDetail
      can :show, :all if employee.employee?
      can :read, :all if employee.lead?
      can :create, :all if employee.lead?
      can :show, LeaveDetail if employee.lead?
      can :show_traniee, LeaveDetail if employee.lead?

      can :manage, :all if employee.hr?
      can :create, :all if employee.hr?
      can :show_hr_leave, LeaveDetail if employee.hr?
  end
end
