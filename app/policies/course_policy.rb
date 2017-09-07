# Course policy
class CoursePolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  def show?
    true
  end

  # Policy scope
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.instructor?
        scope { where instructors.include? user }
      else
        scope
      end
    end
  end
end
