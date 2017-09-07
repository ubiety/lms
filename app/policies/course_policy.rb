# Course policy
class CoursePolicy < ApplicationPolicy
  def index?
    true
  end

  # Policy scope
  class Scope < Scope
    def resolve
      if user.admin? || user.instructor?
        scope.all
      else
        scope
      end
    end
  end
end
