# Course model
class Course < ApplicationRecord
  extend FriendlyId

  has_paper_trail

  has_many :enrolments
  has_many :students, -> { where role: User.roles[:student] },
           through: :enrolments, source: :user
  belongs_to :instructor, class_name: 'User', foreign_key: :instructor_id
  has_many :assignments

  friendly_id :name, use: :slugged

  serialize :start_time, Tod::TimeOfDay
  serialize :end_time, Tod::TimeOfDay
end
