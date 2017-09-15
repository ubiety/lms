# Course model
class Course < ApplicationRecord
  has_paper_trail

  has_many :enrolments
  has_many :students, -> { where role: User.roles[:student] },
           through: :enrolments, source: :user
  belongs_to :instructor, class_name: 'User', foreign_key: :instructor_id
end
