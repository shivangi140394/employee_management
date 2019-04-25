# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(employee)
    employee ||= Employee.new # guest user (not logged in)
    if employee.role.name == "admin"
      can :manage, :all
    else
      can :read, :all
    end
  end
end