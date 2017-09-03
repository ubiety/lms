# User policy
class UsersPolicy < ApplicationPolicy
  def index?
    user.role?(:admin) || user.role?(:instructor)
  end

  def show?
    true
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
