# Course model
class Course < ApplicationRecord
  has_many :enrolments
  has_many :users, through: :enrolments
end
