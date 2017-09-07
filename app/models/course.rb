# Course model
class Course < ApplicationRecord
  has_many :enrolments
  has_many :students, -> { where role: User.roles[:student] },
           through: :enrolments, source: :user
  has_many :instructors, -> { where role: User.roles[:instructor] },
           through: :enrolments, source: :user
end
