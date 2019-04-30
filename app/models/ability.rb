# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(employee)
    
    # can :update, :create, Employee, if employee.role == "employee"
    # can :show, :show_traniee, Employee, if employee.role == "lead"
    # can :create, :show, :destroy, :edit, Employee, if employee.role == "admin"
    # can :create, :edit, Employee, if employee.role == "hr"
    
    employee ||= Employee.new # guest user (not logged in)
    if employee.admin?
      can :manage, :all
    elsif employee.lead?
      can :update, Employee
    else
      can :read, :all
    end
  end
end