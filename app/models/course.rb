# Course model
class Course < ApplicationRecord
  extend FriendlyId

  has_paper_trail

  has_many :enrolments
  has_many :students, through: :enrolments, source: :user
  belongs_to :instructor, class_name: 'User', foreign_key: :instructor_id
  has_many :assignments

  validates :name, presence: true
  validates :instructor_id, uniqueness: { scope: :start_time,
                                          message: 'can only teach one class at a time' }

  friendly_id :name, use: :slugged
end
