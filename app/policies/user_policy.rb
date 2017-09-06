# User policy
class UserPolicy < ApplicationPolicy
  def index?
    user.admin? || user.instructor?
  end

  def new?
    user.admin?
  end

  def show?
    user.admin? || user.instructor?
  end

  def edit?
    user.admin? || user.instructor?
  end

  def update?
    user.admin? || user.instructor?
  end

  def destroy?
    user.admin?
  end

  # Scope
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end
end
