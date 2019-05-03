# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(employee)
    employee ||= Employee.new # guest user (not logged in)
    # if employee.admin?
    #   can :manage, :all

    # elsif employee.hr?
    #   can :manage, :all

    if employee.lead?
      can [:read, :create, :show, :show_traniee, :update], :all
    # elsif employee.hr?
    #   can [:manage, :create, :show, :show_hr_leave], :all 
    end
    # elsif employee.employee?
      # can [:update]
      can :manage, :all if employee.admin?
      can :update, Employee
      can :create, LeaveDetail if employee.employee?
      can :create, Address
      can :create, BankDetail
      can :edit, Address
      can :edit, BankDetail
      can :read, LeaveDetail
      can :show, :all if employee.employee?
      # can :read, :all if employee.lead?
      # can :create, :all if employee.lead?
      # can :show, LeaveDetail if employee.lead?
      # can :show_traniee, LeaveDetail if employee.lead?

      can :manage, :all if employee.hr?
      can :create, :all if employee.hr?
      can :show_hr_leave, LeaveDetail if employee.hr?
  end
end
