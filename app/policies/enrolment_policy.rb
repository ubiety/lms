# Enrolment policy
class EnrolmentPolicy < ApplicationPolicy
  def new?
    user.admin? || user.instructor?
  end

  # policy scope
  class Scope < Scope
    def resolve
      scope
    end
  end
end
