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
    user.role?(:admin) || user.role?(:instructor)
  end

  def destroy?
    user.role?(:admin)
  end

  # Scope
  class Scope < Scope
    def resolve
      if user.role?(:admin)
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end
end
