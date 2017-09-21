class AssignmentPolicy < ApplicationPolicy
  def new?
    user.admin? || user.instructor?
  end

  def create?
    new?
  end

  def show?
    true
  end

  def edit?
    user.admin? || user.instructor?
  end

  def update?
    edit?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
