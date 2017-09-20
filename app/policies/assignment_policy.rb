class AssignmentPolicy < ApplicationPolicy
  def new?
    user.admin? || user.instructor?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
