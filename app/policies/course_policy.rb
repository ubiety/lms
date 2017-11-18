# Course policy
class CoursePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    user.admin? && (User.instructors.count > 0)
  end

  def create?
    new?
  end

  def delete?
    user.admin?
  end

  def edit?
    new?
  end

  def update?
    edit?
  end

  def destroy?
    user.admin?
  end

  # Policy scope
  class Scope < Scope
    def resolve
      case user.role
      when 'admin'
        scope.all
      when 'instructor'
        scope.where('instructor_id = :user_id', user_id: user.id)
      when 'student'
        scope.joins(:enrolments).where('user_id = :user_id', user_id: user.id)
      else
        scope
      end
    end
  end
end
