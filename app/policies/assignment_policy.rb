# Assignment policy
class AssignmentPolicy < ApplicationPolicy
  def new?
    user.admin? || user.instructor?
  end

  def create?
    new?
  end

  def edit?
    user.admin? || user.instructor?
  end

  def show?
    true
  end

  def update?
    edit?
  end

  def destroy?
    user.admin? || user.instructor?
  end

  # Assignment scope
  class Scope < Scope
    def resolve
      scope
    end
  end
end
