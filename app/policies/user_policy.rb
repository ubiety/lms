# User policy
class UserPolicy < ApplicationPolicy
  def index?
    user.admin? || user.instructor?
  end

  def new?
    user.admin?
  end

  def create?
    new?
  end

  def show?
    true
  end

  def edit?
    true
  end

  def update?
    edit?
  end

  def destroy?
    user.admin?
  end

  # User policy scope
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
